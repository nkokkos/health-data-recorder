# == Schema Information
#
# Table name: measurements
#
#  id                   :integer          not null, primary key
#  measure_value        :float(24)
#  device_id            :integer
#  measure_id           :integer
#  created_at           :datetime
#  updated_at           :datetime
#  measurement_block_id :integer
#

class Measurement < ActiveRecord::Base

  belongs_to :measurement_block
  
  #just tests:
  #scope :within_range, -> { where("created_at <= ? AND created_at >= ?", Date.today + 100, Date.today - 100) }
  #scope :test, -> { where('measurements.created_at < ?', 1.week.ago) }
  
  scope :last_7_days,   -> { where("measurements.created_at <= ? and measurements.created_at >= ?", 
						     Date.today, Date.today - 7)  }
  scope :last_30_days,  -> { where("measurements.created_at <= ? and measurements.created_at >= ?", 
							 Date.today, Date.today - 30) }
  scope :last_6_months, -> { where("measurements.created_at <= ? and measurements.created_at >= ?", 
							 Date.today, Date.today - 6.months) }
  #extract should work for postgres too, for now, this works for mysql							 
  scope  :current_year,  -> { where('extract(year from measurements.created_at)=?', Time.current.year) }
  scope  :last_year,     -> { where('extract(year from measurements.created_at)=?', Time.current.year - 1) }
  

  #after_commit :create_event, on: :create

  #chart data method used by morris chart
  def self.chart_data(collection)
    #create a collection of hashes
    collection.map do |created_at, measure_value|
      {
        created_at:created_at.strftime("%Y-%m-%d %H:%M:%S"),
        data:measure_value || 0,
      }
    end
  end

  def self.bmi_percent_calculation(weight, height)
    height_in_meters = height / 100.0
    weight / (height_in_meters * height_in_meters)
  end

  def self.body_fat_through_bmi(bmi,age,sex)
    case sex
    when 1
      ( 1.20 * bmi ) + ( 0.23 * age ) - ( 10.8 * 1) - 5.4
    when 2
      ( 1.20 * bmi ) + ( 0.23 * age ) - ( 10.8 * 0) - 5.4
    end
  end

  def self.build_sql(user_id)
    user = User.find(user_id)
    trigger_block = user.trigger_blocks.last
	triggers = trigger_block.triggers
    #puts triggers
	
	sql_test = "select measure_value from measurements where "
	sql = ""
	
	#puts triggers.size
	
	if triggers.size == 1 
	  sql << " measure_value #{triggers.first.condition} #{triggers.first.measure_value} and measure_id=#{triggers.first.measure_id}" 
	  sql << " and device_id=#{triggers.first.device_id}"
	elsif triggers.size > 1 
	  triggers.each do |t|
	   if !t.equal? triggers.last
	     sql << " measure_value #{t.condition} #{t.measure_value} and measure_id=#{t.measure_id}" 
	     sql << " and device_id=#{t.device_id} and"
	   elsif t.equal? triggers.last
	     sql << " measure_value #{t.condition} #{t.measure_value} and measure_id=#{t.measure_id}" 
	     sql << " and device_id=#{t.device_id}"
	   end
	  end
	end
	
	if sql.blank?
	  puts "no sql"
	else
	  sql_test << sql 
	  out = Measurement.find_by_sql(sql_test)
	  out.size
	  if out.any?
	   "puts any"
	  end
	end
	
  end
  
  def self.build_sql
    users = User.all
	for user in users
	  trigger_blocks = user.trigger_blocks
	  if trigger_blocks.size >= 1
	    trigger_blocks.each do |trigger_block|
		  triggers = trigger_block.triggers
		  patient_id = trigger_block.patient_id
		  last_measurement_block = MeasurementBlock.where(:user_id => patient_id).last
		  #puts (last_measurement_block.id)
		  sql_statement = "select measure_value from measurements where "
	      sql = ""
		  #puts triggers.size
		  if triggers.size == 1 
	        sql << " measure_value #{triggers.first.condition} #{triggers.first.measure_value} and measure_id=#{triggers.first.measure_id}" 
	        sql << " and device_id=#{triggers.first.device_id}"
	      elsif triggers.size > 1 
	        triggers.each do |t|
	          if !t.equal? triggers.last
	            sql << " measure_value #{t.condition} #{t.measure_value} and measure_id=#{t.measure_id}" 
	            sql << " and device_id=#{t.device_id} and"
	          elsif t.equal? triggers.last
	            sql << " measure_value #{t.condition} #{t.measure_value} and measure_id=#{t.measure_id}" 
	            sql << " and device_id=#{t.device_id}"
	          end
	        end
	      end
		
	      #run sql statement for the latest trigger_block pertaining to the 
          #patient 	
	      if sql.blank?
	        # puts "no sql"
	        # do nothing
		  else
	        sql_statement << sql << " and measurement_block_id = #{last_measurement_block.id}" 
	        #puts sql_statement
			out = Measurement.find_by_sql(sql_statement)
	        #puts (out.size)
	        if out.any?
	          event = Event.new
              event.user_id    = user.id			
			  event.patient_id = patient_id
			  event.message    = trigger_block.description
			  event.save
	        end
	      end
		
	  end # trigger_blocks
	 end # if trigger_blocks.size
	end # for user in users
  end #def self.build_sql...
	 
  # measure_id_enum and device_id_enum are methods used by rails_admin
  # to populate the select boxes:
  def measure_id_enum
    Measure.all.map { |u| ["#{u.name}", u.id] }
  end

  def device_id_enum
    Device.all.map { |u| ["#{u.name}", u.id] }
  end

  #just playing around with after commit triggers
  def create_event
    id = self.id
    device_id = self.device_id
    measurement_block_id = self.measurement_block_id
    measurement_blocks  = MeasurementBlock.where(:id => measurement_block_id)
    logger.info "Data_create_event: #{id} #{device_id} #{measure_id} #{measurement_blocks.first.user_id}"
  end

end

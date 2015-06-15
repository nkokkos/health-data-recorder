class Measurement < ActiveRecord::Base

  belongs_to :measurement_block

  after_commit :create_event, on: :create

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


  # measure_id_enum and device_id_enum are methods used by rails_admin
  # to populate the select boxes
  def measure_id_enum
    Measure.all.map { |u| ["#{u.name}", u.id] }
  end

  def device_id_enum
    Device.all.map { |u| ["#{u.name}", u.id] }
  end


  def create_event
    id = self.id
    device_id = self.device_id
    measurement_block = self.measurement_block_id
    measurement_blocks  = MeasurementBlock.where(:id => measurement_block)
    logger.info "Data_create_event: #{id} #{device_id} #{measure_id} #{measurement_blocks.first.user_id}"
  end

end

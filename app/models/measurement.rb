class Measurement < ActiveRecord::Base

  belongs_to :measurement_block

  #chart data method used by morris chart
  def self.chart_data(collection)
    collection.map do |created_at, measure_value|
      {
        created_at:created_at.strftime("%Y-%m-%d %H:%M:%S"),
        data:measure_value || 0,
      }
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

end

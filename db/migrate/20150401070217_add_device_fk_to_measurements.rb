class AddDeviceFkToMeasurements < ActiveRecord::Migration
  def change
    add_foreign_key :measurements, :devices, :name => "device_fk_to_measurements"
  end
end

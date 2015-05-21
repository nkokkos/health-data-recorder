class RemoveDeviceFkFromMeasurements < ActiveRecord::Migration
  def change
    remove_foreign_key :measurements, :name => "device_fk_to_measurements"
  end
end

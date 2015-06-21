class AddDeviceIdAndMeasureIdToTriggers < ActiveRecord::Migration
  def change
    add_column :triggers, :device_id,  :integer
    add_column :triggers, :measure_id, :integer
  end
end

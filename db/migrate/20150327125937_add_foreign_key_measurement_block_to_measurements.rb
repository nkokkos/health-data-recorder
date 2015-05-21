class AddForeignKeyMeasurementBlockToMeasurements < ActiveRecord::Migration
  def change
    add_foreign_key :measurements, :measurement_blocks
  end
end

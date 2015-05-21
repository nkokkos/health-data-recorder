class CreateMeasurementBlocks < ActiveRecord::Migration
  def change
    create_table :measurement_blocks do |t|
      t.time :time_tag
      t.references :user, index: true

      t.timestamps
    end
  end
end

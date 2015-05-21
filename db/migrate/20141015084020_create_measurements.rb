class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.decimal :measure_value
      t.references :device, index: true
      t.references :measure, index: true

      t.timestamps
    end
  end
end

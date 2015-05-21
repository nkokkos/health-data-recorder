class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.string :name
      t.references :device, index: true

      t.timestamps
    end
  end
end

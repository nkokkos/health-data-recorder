class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
      t.string :condition
      t.float :measure_value
      t.references :trigger_block, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

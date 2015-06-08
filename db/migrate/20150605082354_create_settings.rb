class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.boolean :allow_doctor_tracking
      t.integer :device_id
      t.integer :measure_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

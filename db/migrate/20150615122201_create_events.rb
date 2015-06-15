class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :patient_id
      t.text :message

      t.timestamps null: false
    end
  end
end

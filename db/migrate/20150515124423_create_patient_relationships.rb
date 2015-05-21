class CreatePatientRelationships < ActiveRecord::Migration
  def change
    create_table :patient_relationships do |t|
      t.integer :user_id
      t.integer :patient_id

      t.timestamps null: false
    end
  end
end

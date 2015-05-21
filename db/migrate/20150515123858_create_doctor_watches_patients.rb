class CreateDoctorWatchesPatients < ActiveRecord::Migration
  def change
    create_table :doctor_watches_patients do |t|
      t.integer :user_id
      t.integer :patient_id

      t.timestamps null: false
    end
  end
end

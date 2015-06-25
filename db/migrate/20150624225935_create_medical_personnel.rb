class CreateMedicalPersonnel < ActiveRecord::Migration
  def change
    create_table :medical_personnel do |t|
	  t.integer :user_id
      t.integer :personnel_user_id
    end
  end
end

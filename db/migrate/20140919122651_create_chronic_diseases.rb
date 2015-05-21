class CreateChronicDiseases < ActiveRecord::Migration
  def change
    create_table :chronic_diseases do |t|
      t.string :description

      t.timestamps
    end
  end
end

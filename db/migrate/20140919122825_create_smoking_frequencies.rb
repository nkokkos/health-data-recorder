class CreateSmokingFrequencies < ActiveRecord::Migration
  def change
    create_table :smoking_frequencies do |t|
      t.string :description

      t.timestamps
    end
  end
end

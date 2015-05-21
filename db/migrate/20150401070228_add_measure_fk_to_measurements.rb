class AddMeasureFkToMeasurements < ActiveRecord::Migration
  def change
    add_foreign_key :measurements, :measures, :name => "measures_fk_to_measurements"
  end
end

class RemoveMeasureFkFromMeasurements < ActiveRecord::Migration
  def change
    remove_foreign_key :measurements, :name => "measures_fk_to_measurements"
  end
end

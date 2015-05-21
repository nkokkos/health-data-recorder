class ChangeMeasureValueToFloat < ActiveRecord::Migration
  def change
    change_column :measurements, :measure_value, :float
  end
end

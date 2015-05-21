class AddToMeasurement < ActiveRecord::Migration
  def change
    add_column :measurements, :measurement_block_id, :integer
  end
end

class AddUseForeighKeyToMearementBlocks < ActiveRecord::Migration
  def change
    add_foreign_key :measurement_blocks, :users
  end
end

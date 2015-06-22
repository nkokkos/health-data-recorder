class AddDescriptionToTriggerBlocks < ActiveRecord::Migration
  def change
    add_column :trigger_blocks, :description, :string
  end
end

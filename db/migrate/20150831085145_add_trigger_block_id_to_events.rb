class AddTriggerBlockIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :trigger_block_id, :integer
  end
end

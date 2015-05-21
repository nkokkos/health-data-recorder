class AddDefaultValueToHeight < ActiveRecord::Migration
  def change
    change_column :users, :height, :integer, :default => 0
  end
end

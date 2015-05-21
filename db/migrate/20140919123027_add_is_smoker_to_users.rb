class AddIsSmokerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :smoker, :boolean
  end
end

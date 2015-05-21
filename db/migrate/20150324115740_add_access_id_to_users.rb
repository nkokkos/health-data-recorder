class AddAccessIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :access_id, :string
  end
end

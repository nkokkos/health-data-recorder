class AddRfidtagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rfid_tag, :string
  end
end

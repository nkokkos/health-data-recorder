class AddFamilystatusidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :family_status_id, :integer
  end
end

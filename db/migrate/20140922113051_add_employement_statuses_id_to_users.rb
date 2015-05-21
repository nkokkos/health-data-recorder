class AddEmployementStatusesIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :employment_status_id, :integer
  end
end

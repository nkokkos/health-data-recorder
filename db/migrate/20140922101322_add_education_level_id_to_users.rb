class AddEducationLevelIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :education_level_id, :integer
  end
end

class FixSmokerBooleanName < ActiveRecord::Migration
  def change
    rename_column :users, :smoker, :is_smoker
  end
end

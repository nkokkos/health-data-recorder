class AddExercisesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :exercise_activity, :boolean
  end
end

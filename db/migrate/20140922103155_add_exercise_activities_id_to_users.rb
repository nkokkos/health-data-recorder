class AddExerciseActivitiesIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :exercise_activity_id, :integer
  end
end

class FixExerciseActivityName < ActiveRecord::Migration
  def change
    rename_column :users, :exercise_activity, :exercises
  end
end

class CreateExerciseActivities < ActiveRecord::Migration
  def change
    create_table :exercise_activities do |t|
      t.string :description

      t.timestamps
    end
  end
end

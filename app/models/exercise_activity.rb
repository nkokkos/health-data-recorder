# == Schema Information
#
# Table name: exercise_activities
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class ExerciseActivity < ActiveRecord::Base
end

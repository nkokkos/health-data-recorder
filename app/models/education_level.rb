# == Schema Information
#
# Table name: education_levels
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  description :string(255)
#

class EducationLevel < ActiveRecord::Base
end

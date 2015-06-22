# == Schema Information
#
# Table name: employment_statuses
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class EmploymentStatus < ActiveRecord::Base
end

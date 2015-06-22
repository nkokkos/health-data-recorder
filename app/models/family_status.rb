# == Schema Information
#
# Table name: family_statuses
#
#  id         :integer          not null, primary key
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class FamilyStatus < ActiveRecord::Base
end

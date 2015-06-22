# == Schema Information
#
# Table name: measures
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  device_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Measure < ActiveRecord::Base
  belongs_to :device
end

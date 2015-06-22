# == Schema Information
#
# Table name: measurement_blocks
#
#  id         :integer          not null, primary key
#  time_tag   :time
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class MeasurementBlock < ActiveRecord::Base
  belongs_to :user
  has_many   :measurements
end

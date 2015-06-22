# == Schema Information
#
# Table name: triggers
#
#  id               :integer          not null, primary key
#  condition        :string(255)
#  measure_value    :float(24)
#  trigger_block_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  device_id        :integer
#  measure_id       :integer
#

class Trigger < ActiveRecord::Base
  belongs_to :trigger_block
end

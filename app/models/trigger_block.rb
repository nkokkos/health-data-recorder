# == Schema Information
#
# Table name: trigger_blocks
#
#  id          :integer          not null, primary key
#  patient_id  :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string(255)
#

class TriggerBlock < ActiveRecord::Base
  belongs_to :user
  validates  :description, presence: true
  has_many   :triggers, dependent: :destroy
end

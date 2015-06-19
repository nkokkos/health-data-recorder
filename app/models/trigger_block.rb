class TriggerBlock < ActiveRecord::Base
  belongs_to :user
  has_many   :triggers
end

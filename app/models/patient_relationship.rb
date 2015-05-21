class PatientRelationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :patient, :class_name => 'User'
end

class PatientRelationship < ActiveRecord::Base
  #this model is self referencial model referring to patients who happen
  #to be users
  belongs_to :user
  belongs_to :patient, :class_name => 'User'
end

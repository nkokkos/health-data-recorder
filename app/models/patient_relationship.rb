class PatientRelationship < ActiveRecord::Base
  #this model is self referencial model referring to patients who happen
  #to be users
  belongs_to :user,    :class_name => 'User'
  belongs_to :patient, :class_name => 'User'

  validates :user_id, presence: true
  validates :patient_id, presence: true

end

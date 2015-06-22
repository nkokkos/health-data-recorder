# == Schema Information
#
# Table name: patient_relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  patient_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PatientRelationship < ActiveRecord::Base
  #this model is self referencial model referring to patients who happen
  #to be users
  belongs_to :user,    :class_name => 'User'
  belongs_to :patient, :class_name => 'User'

  validates :user_id, presence: true
  validates :patient_id, presence: true

end

module PatientsHelper

  def find_patient_username(patient_id)
    patient = User.find(patient_id)
    patient.username.empty? ? "Patient has not updated his/her name" : patient.username
  end

end

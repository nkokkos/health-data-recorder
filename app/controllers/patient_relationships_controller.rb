class PatientRelationshipsController < ApplicationController

  #create exception if the patient being added is already in the current_user's
  #patient list
  class AlreadyAdded < StandardError
  end

  rescue_from AlreadyAdded, :with => :already_added_exception

  def already_added_exception(exception)
    flash[:error] = "This user is already added to your patients list!!!"
    redirect_to patient_add_remove_path
 end

  def index
    @patients = current_user.patients
  end

  def show
  end

  def create

    patient = User.find(params[:patient_id])

    raise AlreadyAdded if current_user.patients.ids.include? patient.id

    @patient = current_user.patient_relationships.build(:patient_id => params[:patient_id])
    if @patient.save
      flash[:notice] = "Added patient."
      #redirect_to root_url
      redirect_to patient_add_remove_path
    else
      flash[:notice] = "Unable to add patient."
      #redirect_to root_url
      redirect_to patient_add_remove_path
    end
  end

  def destroy
    @patient = current_user.patient_relationships.find(params[:id])
    @patient.destroy
    flash[:notice] = "Removed patient."
    #redirect_to users_settings_url
    redirect_to patient_add_remove_path
  end

  def add_remove
  end

end

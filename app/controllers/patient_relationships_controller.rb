class PatientRelationshipsController < ApplicationController

  def index
    @patients = current_user.patients
  end

  def show
  #
  end

  def create
    @patient = current_user.patient_relationships.build(:patient_id => params[:patient_id])
    if @patient.save
      flash[:notice] = "Added patient."
      #redirect_to root_url
      redirect_to users_settings_path
    else
      flash[:notice] = "Unable to add patient."
      #redirect_to root_url
      redirect_to users_settings_path
    end
  end

  def destroy
    @patient = current_user.patient_relationships.find(params[:id])
    @patient.destroy
    flash[:notice] = "Removed patient."
    #redirect_to users_settings_url
    redirect_to users_settings_path
  end

  def add_remove
  end

end

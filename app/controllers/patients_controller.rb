class PatientsController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new]

  def index
    @user = User.find(current_user.id)
    @patients = @user.patient_relationships
  end

  def show
    @user = User.find(params[:id])
  end

  def add_remove
  end

end

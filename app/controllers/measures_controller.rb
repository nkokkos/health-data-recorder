class MeasuresController < ApplicationController

  #this "updates" method is used to show personal measurement updates: 
  #-> http://hostname/measurement_updates
  def updates
    @user = User.find(current_user.id)
    @measurements = @user.measurements.all.order(:created_at => "asc")
  end

  def show
    @current_device  = Device.find(params[:device_id])
    @current_measure = @current_device.measures.find(params[:id])
    @user            = User.find(current_user.id)
    @data            = @user.measurements.all.where("device_id = ? AND measure_id = ?", 
                      params[:device_id], params[:id]).order(:created_at => "asc").pluck(:created_at, :measure_value)
					  
    respond_to do |format|
      format.html
      format.json { render :json => @data }
    end 	
	
  end

end

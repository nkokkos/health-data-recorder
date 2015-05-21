class MeasuresController < ApplicationController

  def index
  end

  def show
    @current_device  = Device.find(params[:device_id])
    @current_measure = @current_device.measures.find(params[:id])
    @user            = User.find(current_user.id)
    @data            = @user.measurements.where("device_id = ? AND measure_id = ?", 
                      params[:device_id], params[:id]).order(:created_at => "asc").pluck(:created_at, :measure_value)

  end

end

class DevicesController < ApplicationController

  def index
  end

  def show
    @current_device = Device.find(params[:id])
    @user           = User.find(current_user.id)
    @data           = @user.measurements.where("device_id = ?",
                                               params[:id]).order(:created_at => "asc").pluck(:created_at, :measure_value)

  end

end

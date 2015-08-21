class DevicesController < ApplicationController

  def index
    @user           = User.find(current_user.id)
    @current_device = Device.find(params[:id])
    measure_ids     = @current_device.measures.ids

    @data            = @user.measurements.all.where("device_id = ? AND measure_id IN(?)",
                       @current_device.id, measure_ids).order(:created_at => "asc").pluck(:created_at, :measure_value,:measure_id)

    respond_to do |format|
      format.html
      format.json { render :json => @data }
    end

  end

  def show
    @user           = User.find(current_user.id)
    @current_device = Device.find(params[:id])
    @measure_ids     = @current_device.measures.ids

    @data            = @user.measurements.all.where("device_id = ? AND measure_id IN(?)",
                       @current_device.id, @measure_ids).order(:created_at => "asc").pluck(:created_at, :measure_value,:measure_id)

    respond_to do |format|
      format.html
      format.json { render :json => @data }
    end

  end





=begin
  def show
    @current_device = Device.find(params[:id])
    @user           = User.find(current_user.id)
    @data           = @user.measurements.where("device_id = ?",
                                               params[:id]).order(:created_at => "asc").pluck(:created_at, :measure_value)

  end
=end

end

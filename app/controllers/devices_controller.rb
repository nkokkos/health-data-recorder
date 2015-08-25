class DevicesController < ApplicationController

  def show
    @user           = User.find(current_user.id)
    @current_device = Device.find(params[:id])
    @measure_ids    = @current_device.measures.ids

    @measure_names  = []

    @current_device.measures.each do |measure|
      @measure_names << measure.name
    end

    @data  = @user.measurements.all.where("device_id = ? AND measure_id IN(?)",
      @current_device.id, @measure_ids).order(:created_at => "asc").pluck(:created_at, :measure_value, :measure_id)

    respond_to do |format|
      format.html
      format.json { render :json => @data }
    end

  end

end

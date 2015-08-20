class MeasuresController < ApplicationController

  #this "updates" method is used to show personal measurement updates:
  #-> http://hostname/measurement_updates
  def updates
    @user = User.find(current_user.id)
    @measurements = @user.measurements.all.order(:created_at => "asc")
  end

  #default data range is "last 6 months"
  def show
    @current_device  = Device.find(params[:device_id])
    @current_measure = @current_device.measures.find(params[:id])
    @user            = User.find(current_user.id)
    @data            = @user.measurements.all.last_6_months.where("device_id = ? AND measure_id = ?",
                      params[:device_id], params[:id]).order(:created_at => "asc").pluck(:created_at, :measure_value)

    respond_to do |format|
      format.html
      format.json { render :json => @data }
    end

  end


  def sevendays
    @current_device  = Device.find(params[:device_id])
    @current_measure = @current_device.measures.find(params[:id])
    @user            = User.find(current_user.id)
    @data            = @user.measurements.all.last_7_days.where("device_id = ? AND measure_id = ?",
                      params[:device_id], params[:id]).order(:created_at => "asc").pluck(:created_at, :measure_value)

	  respond_to do |format|
      format.json { render :json =>  Measurement.chart_data(@data) }
    end

  end


  def thirtydays
    @current_device  = Device.find(params[:device_id])
    @current_measure = @current_device.measures.find(params[:id])
    @user            = User.find(current_user.id)
    @data            = @user.measurements.all.last_30_days.where("device_id = ? AND measure_id = ?",
                      params[:device_id], params[:id]).order(:created_at => "asc").pluck(:created_at, :measure_value)

	  respond_to do |format|
      format.json { render :json =>  Measurement.chart_data(@data) }
    end

  end

  def sixmonths
    @current_device  = Device.find(params[:device_id])
    @current_measure = @current_device.measures.find(params[:id])
    @user            = User.find(current_user.id)
    @data            = @user.measurements.all.last_6_months.where("device_id = ? AND measure_id = ?",
                      params[:device_id], params[:id]).order(:created_at => "asc").pluck(:created_at, :measure_value)

    respond_to do |format|
      format.json { render :json => Measurement.chart_data(@data) }
    end

  end

  def c_year
    @current_device  = Device.find(params[:device_id])
    @current_measure = @current_device.measures.find(params[:id])
    @user            = User.find(current_user.id)
    @data            = @user.measurements.all.current_year.where("device_id = ? AND measure_id = ?",
                      params[:device_id], params[:id]).order(:created_at => "asc").pluck(:created_at, :measure_value)

    respond_to do |format|
      format.json { render :json => Measurement.chart_data(@data) }
    end

  end

  def l_year
    @current_device  = Device.find(params[:device_id])
    @current_measure = @current_device.measures.find(params[:id])
    @user            = User.find(current_user.id)
    @data            = @user.measurements.all.last_year.where("device_id = ? AND measure_id = ?",
                      params[:device_id], params[:id]).order(:created_at => "asc").pluck(:created_at, :measure_value)

    respond_to do |format|
      format.json { render :json => Measurement.chart_data(@data) }
    end

  end

end

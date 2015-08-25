class DevicesController < ApplicationController
  before_filter :load_common_data

  def show
    @data  = @user.measurements.all.where("device_id = ? AND measure_id IN(?)",
      @current_device.id, @measure_ids).order(:created_at => "asc").pluck(:created_at, :measure_value, :measure_id)

    respond_to do |format|
      format.html
      format.json { render :json => @data }
    end

  end

  def sevendays
    @data  = @user.measurements.all.last_7_days.where("device_id = ? AND measure_id IN(?)",
      @current_device.id, @measure_ids).order(:created_at => "asc").pluck(:created_at, :measure_value, :measure_id)

    respond_to do |format|
      format.html
      format.json { render :json => Measurement.chart_data_for_device(@data) }
    end

  end

  def thirtydays
    @data  = @user.measurements.all.last_30_days.where("device_id = ? AND measure_id IN(?)",
      @current_device.id, @measure_ids).order(:created_at => "asc").pluck(:created_at, :measure_value, :measure_id)

    respond_to do |format|
      format.html
      format.json { render :json => Measurement.chart_data_for_device(@data) }
    end

  end

  def sixmonths
    @data  = @user.measurements.all.last_6_months.where("device_id = ? AND measure_id IN(?)",
      @current_device.id, @measure_ids).order(:created_at => "asc").pluck(:created_at, :measure_value, :measure_id)

    respond_to do |format|
      format.html
      format.json { render :json => Measurement.chart_data_for_device(@data) }
    end

  end

  def c_year
    @data  = @user.measurements.all.current_year.where("device_id = ? AND measure_id IN(?)",
      @current_device.id, @measure_ids).order(:created_at => "asc").pluck(:created_at, :measure_value, :measure_id)

    respond_to do |format|
      format.json { render :json => Measurement.chart_data_for_device(@data) }
    end

  end

  def l_year
    @data  = @user.measurements.all.last_year.where("device_id = ? AND measure_id IN(?)",
      @current_device.id, @measure_ids).order(:created_at => "asc").pluck(:created_at, :measure_value, :measure_id)

    respond_to do |format|
      format.json { render :json => Measurement.chart_data_for_device(@data) }
    end

  end

  def load_common_data
    @user           = User.find(current_user.id)
    @current_device = Device.find(params[:id])
    @measure_ids    = @current_device.measures.ids

    @measure_names  = []

    @current_device.measures.each do |measure|
      @measure_names << measure.name
    end

  end

end

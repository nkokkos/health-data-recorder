class HomeController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new]

  def index
    #find current user
    @user = User.find(current_user.id)
    #get all devices
    @devices = Device.all

    #grabs sex description, should be "Male" or "Female"
    @sex = Sex.where(:id => @user.sex_id).first
    @current_age = User.age_calculation(@user.birth_date)

    #grab setting from user that measures weight
    measure_row   = Measure.where(:id => user.setting.measure_id).first
    #grab device's name that measures weight
    @device_name = Device.find(Measure.all.includes(:device).where(name: measure_row.name).first.device_id).name
    #grab the latest created value for this user's weight:
    last_weight_measurement = @user.measurements.where(:measure_id =>measure_row.id).order(:created_at => "desc").first

    if last_weight_measurement.nil?
      @last_weight_measurement = 0
    else
      @last_weight_measurement =  @user.measurements.where(:measure_id =>measure_id).order(:created_at => "desc").first.measure_value
    end

    #bmi_percent_fat_calculation is defined in application_controller.rb
    if @sex.nil?
      @error_message = "Body Fat % and BMI require your age. Enter your correct birthday in the settings"
    else
      @bmi = Measurement.bmi_percent_calculation(@last_weight_measurement,@user.height)
      @body_fat = Measurement.body_fat_through_bmi(@bmi,@current_age, @sex.id)
    end

  end # end of index

  def new
  end

  def edit
  end

end

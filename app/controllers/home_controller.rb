class HomeController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :edit]

  def index
  #grab user from the params and throw an exception if the user can not
  #be found
  begin
    user = User.find(current_user.id)
  rescue ActiveRecord::RecordNotFound => e
    #redirect_to patients_path and return if user.nil?
    #redirect_to root_path # putting return if user.nil? as above is redundant
    flash[:error] = "User not found"
  end

    #check if the user is part of the current_user's patients collection
    #if current_user.patients.ids.include? user.id
    @user = user
    @sex = Sex.where(:id => @user.sex_id).first
    @current_age = User.age_calculation(@user.birth_date)

    #grab setting from user that measures weight:
    begin
      measure_row = Measure.where(:id => @user.setting.measure_id) #returns a relation
    rescue ActiveRecord::RecordNotFound => e
      flash[:alert] = 'Measure not found'
      #redirect_to root_path
    rescue StandardError => e
      #flash[:error] = e.message + " User has not updated settings for measure device"
      flash[:error] = "User has not updated settings for measure device"
      #redirect_to root_path
    end

    if measure_row
      #grab device's name that measures weight
      begin
        @device_name = Device.find(Measure.where(name: measure_row.first.name).first.device_id).name
        #grab the latest created value for this user's weight:
        last_weight_measurement = @user.measurements.where(:measure_id => measure_row.first.id).order(:created_at => "desc").first
        if last_weight_measurement.nil?
          @last_weight_measurement = 0
        else
          @last_weight_measurement = last_weight_measurement.measure_value
        end
        #bmi_percent_fat_calculation is defined in application_controller.rb
        if @sex.nil?
          @error_message = "Body Fat % and BMI require your age. Enter your correct birthday in the settings"
          @bmi = 0
          @body_fat = 0
        else
          @bmi = Measurement.bmi_percent_calculation(@last_weight_measurement,@user.height)
          @body_fat = Measurement.body_fat_through_bmi(@bmi,@current_age, @sex.id)
        end
      rescue ActiveRecord::RecordNotFound => e
        @device_name = e.message
      rescue StandardError => e
        #flash[:error] = e.message + " User has not updated settings for device"
        flash[:error] = "You have not updated your settings for device/measures!"
        #redirect_to root_path
      end
    elsif measure_row.nil?
      @device_name = "Error, user has not selected a measure device in his/her settings"
    end # if measure_row

end

  def new
  end

  def edit
  end

end

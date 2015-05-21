class HomeController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new]

  def index
    @user = User.find(current_user.id)
    @devices = Device.all

 
    # kilograms related to Tanita scale measurements. Tanita scale has
    # an id = 1 in devices table, Tanita_Scale_id is configured in
    # config/application.yml
=begin

	@kilograms = @user.measurements.where(:device_id => ENV["Tanita_Scale_id"]).order(:created_at => "asc").pluck(:created_at, :measure_value)

    if @user.height == 0 || @user.height.nil?
	  @bmi = 0
    elsif @user.height > 0
	  #First of all, check if this user has any measurements:
	  if @user.measurements.size != 0
	    # grab the latest weight measurement. This is hack to get Tanita's
		# device id = 1
	    #@latest_user_weight = @user.measurements.where(:device_id => ENV["Tanita_Scale_id"]).order(:created_at => "desc").limit(1).first.measure_value
	    @latest_user_weight = 0
		#  if @latest_user_weight.nil?
	    #    @bmi = 0
        #  else
        #    ## bmi calculation is based on the following formula:
        #    ## BMI = weight(kgr) / (height in meters)^2
	    #    @bmi = @latest_user_weight / (@user.height / 100.0)**2
	    #  end
	  else
	    @bmi = @latest_user_weight = 0.0
	  end

    end
=end
  end # end of index

  def new
  end

  def edit
  end

end

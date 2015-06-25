class RegistrationsController < Devise::RegistrationsController

  # disable new and create methods to make registrations open.Currently they
  # are closed
  def new
    #flash[:alert] = 'Registrations are not open yet, but please check back soon'
    render "nosignup"
  end

  #disable new and create methods to make registrations open.Currently closed
  def create
    #flash[:alert] = 'Registrations are not open yet, but please check back soon'
    render "nosignup"
  end

  def index
    @user = User.find(current_user.id)
    @setting = @user.setting
  end

  def edit
    @user = User.find(current_user.id)
    #@setting = @user.setting
  end

  def token
    @user = User.find(current_user.id)
    @user.generate_access_token # generate_token_ is defined in models/user.rb
    @setting = @user.setting
    render "settings" #will load the setting view
  end

  #def update_resource(resource, secure_params)
    #resource.update_without_password(secure_params)
  #end

  # this will load the settings view. need this controller to load user settings
  def settings
    @user = User.find(current_user.id)
    @setting = @user.setting
  end

  def settings_save
    @user = User.find(current_user.id)
    @setting = @user.setting
    if @setting.update(settings_params)
      # if the user decides he/she does not want to be tracked by the Doctor
      # then we should delete the relationship as well:
      #@patient = current_user.patient_relationships.find(params[:id])
      #@patient.destroy
      #flash[:notice] = "Removed patient."

      flash[:alert] = 'Your settings were saved'
      redirect_to users_settings_path
    else
      flash[:alert] = 'Error updating your settings'
      redirect_to root_path
    end
    #@setting = @user.setting.update(:patient_id => params[:patient_id])
    #@setting = @user.setting
  end


  def settings_params
    params.require(:setting).permit(:allow_doctor_tracking, 
	               :device_id, :measure_id)
  end

  def update
    @user = User.find(current_user.id)
    #if @user.update_with_password(secure_params) #-> that's if you want to update with password prompt
	  if @user.update_without_password(secure_params)
	    #logger.debug "user.update_with_password"
      set_flash_message :notice, :updated
  	  sign_in @user, :bypass => true
	    redirect_to after_update_path_for(@user)
	    #render "edit"
    else
	    #logger.debug "rendering edit"
      render "edit"
    end
  end
  
  def update_medical_personnel
    @user = User.find(current_user.id)
    if params.has_key?(:user)
	#if @user.update_with_password(secure_params) #-> that's if you want to update with password prompt
	  if @user.update_without_password(secure_params)
	  #logger.debug "user.update_with_password"
      #set_flash_message :notice, :updated
  	  #sign_in @user, :bypass => true
	    flash[:alert] = 'Your settings were saved'
        redirect_to users_settings_path
      else
	    #logger.debug "rendering edit"
        redirect_to root_path
      end
	else #has deselected all the checkboxes
	  @user.medical_personnel_ids = [] # update the assosiated table.
	  @user.save
	  redirect_to users_settings_path
	end

  end
  
  

  def secure_params
	  params.require(:user).permit(:email,
		  :username, :remember_me,
			:password,
			:password_confirmation,
			:additional_info,
			:birth_date,
			:sex_id,
			:height,
			:rfid_tag,
			:exercise_activity,
			:exercise_activity_id,
			:education_level_id,
            :exercises,
			:is_smoker,
			:smoking_frequency_id,
			:access_id,
			{:medical_personnel_ids => []},
			{:chronic_disease_ids => []})
  end

 # you may override this method
 # protected
 #   def after_update_path_for(resource)
 #
 #   end
end

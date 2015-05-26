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
  end
 
  def edit
    @user = User.find(current_user.id)
  end

  def token
    @user = User.find(current_user.id)
    @user.generate_access_token # generate_token_ is defined in models/user.rb
    render "settings"
  end

  #def update_resource(resource, secure_params)
    #resource.update_without_password(secure_params)
  #end

  def settings
    @user = User.find(current_user.id)
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
			{:chronic_disease_ids => []})
  end

 # you may override this method
 # protected
 #   def after_update_path_for(resource)
 #
 #   end
end

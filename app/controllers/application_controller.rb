class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_user!
  before_filter :update_sanitized_params, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def age_calculation(birthday)
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def bmi_percent_fat_calculation(weight, height, age, sex)
    height_in_meters = height / 100.0
    weight / (height_in_meters * height_in_meters)
  end


  def update_sanitized_params

    devise_parameter_sanitizer.for(:sign_up) {
      |u| u.permit(:email,:password,:password_confirmation)
    }

    devise_parameter_sanitizer.for(:sign_in) {
      |u| u.permit(:email,:password,:remember_me)
    }

	#devise_parameter_sanitizer.for(:account_update) {
    #  |u| u.permit(:email,:username,:current_password)
    #}

	devise_parameter_sanitizer.for(:account_update) {
      |u| u.permit(:email,:username)
    }

  end

end

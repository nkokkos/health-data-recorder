
class Api::BaseController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  protect_from_forgery with: :null_session
  before_action :destroy_session
  before_filter :authenticate_user_with_access_key!
  respond_to    :json

    def authenticate_user_with_access_key!

        puts "request.content_type: " + request.content_type

          if request.get? || request.post? &&
             request.headers["Authorization"] &&
             request.content_type == "application/json" &&
             User.find_by_access_id(request.headers["Authorization"])

            @current_user = User.find_by_access_id(request.headers["Authorization"])
          else
            respond_to do |format|
                  format.json { render json:  {:result => "Fail",
                                                                       :message => "Token is invalid or User was not found"
                                                                          }.to_json }
                end
          end
        end

        def current_user_from_api_access
          @current_user
        end

 def destroy_session
    request.session_options[:skip] = true
  end


  private

  def record_not_found
    render json:  {:result => "Fail", :message => "User was not found. Abort"}.to_json
  end
end

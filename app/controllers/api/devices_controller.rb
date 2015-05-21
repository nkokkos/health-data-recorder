class Api::DevicesController < Api::BaseController
  # responds to json or html requests 
  # through inheritance from BaseController:

  def index
    if current_user_from_api_access
      respond_to do |format|
        format.json { render json:  Device.all.to_json }
        format.html { render text:  Device.all.to_json  }
      end
	else
	 respond_to do |format|
           format.json { render json: { "result" => "Fail", "message" =>  "Invalid user"  }.to_json }
           #format.html { render json: { "result" => "Fail","message"  =>  "Invalid user"  }.to_json }
         end
        end
  end
	

=begin	
	private
      def restrict_access
	    if params[:access_token] == nil
		 grades = { "Jane Doe" => 10, "Jim Doe" => 6 }
		 # result = { :result_code => "Fail",
		 #            :Message => "No access token"}.to_json
		#		   }
		  respond_with(grades.to_json)
		 head :unauthorized
		 return
		end
       userx = User.find_by_access_id(params[:access_token])
		head :unauthorized unless userx
       end
=end

end



class Api::MeasurementBlocksController < Api::BaseController
  # responds to json or html requests 
  # through inheritance from BaseController
  
  def index
    if current_user_from_api_access
	  measurement_blocks = MeasurementBlock.where(user_id: current_user_from_api_access.id) 
	    if !measurement_blocks.nil? 
	      respond_to do |format| 
            format.json { render json: measurement_blocks.all.to_json  }
	         #format.html { render text: measurement_blocks.all.to_json  }
          end
	    else
	       respond_to do |format|
             format.json { render json: { "result" => "Fail", "message" =>  "no measurement blocks exit for this user"  }.to_json }
	         #format.html { render json: { "result" => "Fail", "message" =>  "no measurement blocks exit for this user"  }.to_json }
           end	      
	    end # if !measurement_blocks.nil? 
    else # if current_user_from_api_access
      respond_to do |format|
        format.json { render json: {"result" =>"Fail", "message" => "Invalid User"}.to_json }
      end
    end # if current_user_from_api_access
  end
  
   def create
    if current_user_from_api_access
	
	  measurement_block = MeasurementBlock.create(:user_id => current_user_from_api_access.id, :time_tag => params["time_tag"])
	  
	  if !measurement_block.nil? 
	      respond_to do |format| 
            format.json { render json: measurement_block.to_json  }
	        format.html { render text: measurement_block.to_json  }
          end
	    else
	       respond_to do |format|
             format.json { render json: { "result" => "Fail", "message" =>  "failed to create measurement block"  }.to_json }
	         format.html { render json: { "result" => "Fail", "message" =>  "failed to create measurement block"  }.to_json }
           end	      
	    end # if !measurement_block.nil? 
    end # if current_user_from_api_access
  end
 
end

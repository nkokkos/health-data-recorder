class Api:MeasuresController < Api::BaseController
  # responds to json or html requests
  # through inheritance from BaseController:
  def index
    if current_user_from_api_access
      respond_to do |format|
        format.json { render json:  Measure.all.to_json }
        format.html { render text:  Measure.all.to_json  }
      end
    else
      respond_to do |format|
        format.json { render json: { "result" => "Fail", "message" =>  "Invalid user"  }.to_json }
        #format.html { render json: { "result" => "Fail","message"  =>  "Invalid user"  }.to_json }
      end
    end
  end
end


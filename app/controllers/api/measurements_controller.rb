class Api::MeasurementsController < Api::BaseController
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key_found
  # responds to json or html requests
  # through inheritance from BaseController:

  def index
    #respond_with
    if current_user_from_api_access
      respond_to do |format|
        format.json { render json:  current_user_from_api_access.measurements.all.to_json }
	format.html { render text:  current_user_from_api_access.measurements.all.to_json  }
      end
    else
      respond_to do |format|
        format.json { render json: { "result" => "Fail", "message" =>  "Invalid user"  }.to_json }
      end
    end  
  end





  def create
    if current_user_from_api_access
	  #params.inspect
      #convert to float
      @measure_value = params["measure_value"].to_f
      #this will return a record of the device
      @device  = Device.find_or_create_by(:name => params["device_id"])

	  if !measure_found_for_device_id?(@device.name, params["measure_id"])
        #add the measure id for the associated device name
        @measure = add_measure_for_device(@device.name, params["measure_id"])
      else
        # return an existing measure record associated with the device
        @measure = measure_for_device(@device.name, params["measure_id"])
      end

      @measurement = Measurement.new(:measure_value => @measure_value,
								   :device_id  => @device.id,
								   :measure_id => @measure.id,
								   :measurement_block_id => params["measurement_block_id"])

	  #sql:
	  #measure_value numeric, #device_id integer, #measure_id integer,
	  #created_at timestamp without time zone,
	  #updated_at timestamp without time zone,
	  #measurement_block_id integer,

	  if @measurement.save
	    respond_to do |format|
          format.json { render json: @measurement.to_json  }
	      #format.html { render text: @measurement.to_json  }
        end
	  else
	    respond_to do |format|
          format.json { render json: { "result" => "Fail", "message" =>  "failed to create measurement"  }.to_json }
	      #format.html { render json: { "result" => "Fail", "message" =>  "failed to create measurement"  }.to_json }
        end
	  end # if measurement.save?

  end #if current_user_from_api_access

  end #def create


  private

  def invalid_foreign_key_found
    render json: { "result" => "Fail", "message" =>  "device id/measure id/measurement block id fk violation"}.to_json
  end

  def measure_found_for_device_id?(device_id, measure_id)
    device = Device.where(:name => device_id)
    measures = 0
    if device.any?
      measures = device.first.measures.where(:name => measure_id)
    end
    return true if measures.size > 0
    false
  end

  #returns the measure record associated with the device
  def measure_for_device(device_id, measure_id)
    device = Device.where(:name => device_id)
    # use first on device to get record from association, then
    # use first again on measures to get measure record
    device.first.measures.where(:name => measure_id).first if device.any?
  end

  def add_measure_for_device(device_name, measure_name)
    device =  Device.where(:name => device_name)
    if !device.nil?
      measure = device.first.measures.build name: measure_name
      measure.save
      return measure
    end
  end

end #class Api::MeasurementsController < Api::BaseController

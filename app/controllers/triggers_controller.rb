class TriggersController < ApplicationController
  before_filter :load_current_user
  
  def show
    #@user = User.find(current_user.id)
	@trigger_block = TriggerBlock.where(:id => params[:trigger_block_id])
	@trigger = @trigger_block.first.triggers.where(:id => params[:id])
	@patient = User.where(:id => params[:patient_id])
  end

  def index
    #@user = User.find(current_user.id)
	@trigger_block = TriggerBlock.where(:id => params[:trigger_block_id])
	@triggers = @trigger_block.first.triggers
	@patient = User.where(:id => params[:patient_id])
  end

  def edit
	@trigger = Trigger.find(params[:id])
	@patient = User.where(:id => params[:patient_id])
  end
    
  def new
    #@user = User.find(current_user)
    @trigger_block  = TriggerBlock.where(:id => params[:trigger_block_id])
	@trigger = @trigger_block.first.triggers.build
  end
  
  def create
    @trigger_block  = TriggerBlock.where(:id => params[:trigger_block_id])
    @trigger = @trigger_block.first.triggers.create(trigger_params)	
	respond_to do |format|
     if @trigger.save
        format.html { redirect_to  patient_trigger_block_triggers_path , notice: 'Trigger was successfully created.' }
        #format.json { render :show, status: :created, location: @trigger }
      else
        format.html { render :new }
        format.json { render json: @trigger.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
  @trigger = Trigger.find(params[:id])
  #if request.post?
     if(@trigger.update_attributes(trigger_params))
       redirect_to patient_trigger_block_triggers_path
	 end
   #else
   #   render :action => edit_patient_trigger_block_triggers_path
  #end
  end
  
  
  def destroy
    @trigger = Trigger.find(params[:id])
    @trigger.destroy
      respond_to do |format|
        format.html { redirect_to   patient_trigger_block_triggers_path  , notice: 'Trigger was successfully destroyed.' }
        format.json { head :no_content }
     end
  end
  
 private
  def trigger_params
     params.require(:trigger).permit(:device_id, :measure_id, :measure_value, :condition)
  end
  
  def load_current_user
    @user = User.find(current_user.id)
  end

end
class TriggersController < ApplicationController
  before_filter :load_current_user
  
  def show
  end

  def index
    @user = User.find(current_user.id)
	@trigger_block = TriggerBlock.where(:id => params[:trigger_block_id])
	@triggers = @trigger_block.first.triggers
	@patient = User.where(:id => params[:patient_id])
  end

  def edit
  end
  
  def new
    @user = User.find(current_user)
    @trigger_block  = TriggerBlock.where(:id => params[:trigger_block_id])
	@trigger = @trigger_block.first.triggers.build
  end
  
  def create
    @trigger_block  = TriggerBlock.where(:id => params[:trigger_block_id])
    @trigger = @trigger_block.triggers.create(trigger_params)
	redirect_to patient_trigger_block_triggers_path 
  end
  
 private
  def trigger_params
     params.require(:trigger).permit(:device_id, :measure_id)
  end
  
  def load_current_user
    @user = User.find(current_user.id)
  end

end
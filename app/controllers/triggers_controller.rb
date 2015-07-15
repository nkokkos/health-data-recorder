class TriggersController < ApplicationController
  
  def show
  end

  def index
    @user = User.find(current_user.id)
	@trigger_block = TriggerBlock.where(:id => params[:trigger_block_id])
	@triggers = [1,2,3]
	@patient = User.where(:id => params[:patient_id])
  end

  def edit
  end
end

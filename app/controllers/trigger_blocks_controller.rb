class TriggerBlocksController < ApplicationController
  before_filter :load_current_user, :authenticate_user!, :only => [:index, :new, :edit, :show]

  def index
    #@user = User.find(current_user)
    @patient = @user.patients.where(:id => params[:patient_id] )
    @trigger_blocks = current_user.trigger_blocks.where(:patient_id => params[:patient_id] )
  end


  def new
    #@user = User.find(current_user)
    @trigger_block = TriggerBlock.new
  end

  def create
    @user = User.find(current_user.id)
    @trigger_block = TriggerBlock.create(trigger_block_params)
    @trigger_block.patient_id = params[:patient_id] # this id refers to the patient_id
    @trigger_block.user_id    = current_user.id

    respond_to do |format|
      if @trigger_block.save
         format.html { redirect_to  patient_trigger_blocks_path , notice: 'TriggerBlock was successfully created.' }
        #format.html { redirect_to @trigger_block, notice: 'TriggerBlock was successfully created.' }
        #format.json { render :show, status: :created, location: @trigger_block }
      else
        format.html { render :new }
        format.json { render json: @trigger_block.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @trigger_block = TriggerBlock.find(params[:id])
    @trigger_block.destroy
      respond_to do |format|
        format.html { redirect_to  patient_trigger_blocks_path , notice: 'TriggerBlock was successfully destroyed.' }
        format.json { head :no_content }
     end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def trigger_block_params
    params.require(:trigger_block).permit(:description,:id)
  end

  def load_current_user
    @user = User.find(current_user.id)
  end
  
end

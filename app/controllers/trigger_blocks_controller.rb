class TriggerBlocksController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :edit, :show]


  def index
    @user = User.find(current_user)
    @patient = @user.patients.where(:id => params[:id] )
    @trigger_blocks = current_user.trigger_blocks
  end


  def new
    @user = User.find(current_user)
    @trigger_block = TriggerBlock.new
  end

  def create
    @trigger_block = TriggerBlock.new(trigger_block_params)
    @trigger_block.patient_id = params[:id] # this id refers to the patient_id
    @trigger_block.user_id    = current_user.id

    respond_to do |format|
      if @trigger_block.save
         format.html { redirect_to trigger_blocks_path, notice: 'TriggerBlock was successfully created.' }
        #format.html { redirect_to @trigger_block, notice: 'TriggerBlock was successfully created.' }
        #format.json { render :show, status: :created, location: @trigger_block }
      else
        format.html { render :new }
        format.json { render json: @trigger_block.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @trigger_block = TriggerBlock.find(params[:trblock_id])
    @trigger_block.destroy
      respond_to do |format|
        format.html { redirect_to trigger_blocks_path, notice: 'trigger_block was successfully destroyed.' }
        format.json { head :no_content }
     end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def trigger_block_params
    params.require(:trigger_block).permit(:description,:id)
  end


end

class EventsController < ApplicationController

=begin
  def index
	  @user = User.find(current_user.id)
      @events = @user.events.all.order("created_at desc")

    respond_to do |format|
      format.html
      format.json { render :json => @events }
    end


  end
=end
  
  def index
    @user = User.find(current_user.id)
    respond_to do |format|
      format.html
      format.json { render json: EventsDatatable.new(view_context) }
    end
  end
  
   def destroy
   @user = User.find(current_user.id)
   logger.debug "Event: #{@user.inspect}"   
   event = @user.events.where("id=?", params[:id]).first
   logger.debug "Event: #{event.inspect}"
   #event = Event.find(params[:id])
   event.destroy
      respond_to do |format|
        format.html { redirect_to   events_url  , notice: 'Event was successfully destroyed.' }
        format.json { head :no_content }
     end
  end
  
 
end

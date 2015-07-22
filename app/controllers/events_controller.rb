class EventsController < ApplicationController

  def index
    #@user   = User.find(current_user.id)
	#@events = @user.events
	@user = User.find(current_user.id)
    @events = @user.events.order("created_at DESC")	
  end

end

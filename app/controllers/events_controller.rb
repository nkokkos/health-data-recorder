class EventsController < ApplicationController

  def index
	  @user = User.find(current_user.id)
    @events = @user.events.all.order("created_at DESC")
  end

end

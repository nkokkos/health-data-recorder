class EventsController < ApplicationController

  def index
	  @user = User.find(current_user.id)
    @events = @user.events.all.order("created_at desc")

    respond_to do |format|
      format.html
      format.json { render :json => @events }
    end


  end

end

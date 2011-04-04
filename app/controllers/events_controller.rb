class EventsController < ApplicationController
  def index
    @events = Event.order("start_time ASC")
    @section = "festival"

    respond_to do |format|
      format.html # index.haml
      format.xml { render :xml => @events.to_xml }
    end
  end

  def show
    @event = Event.find(params[:id])
    @section = "festival"
    
    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @event.to_xml }
    end
  end

end

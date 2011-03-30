class EventsController < ApplicationController
  def index
    @events = Event.order("sort_order DESC")

    respond_to do |format|
      format.html # index.haml
      format.xml { render :xml => @events.to_xml }
    end
  end

  def show
    @event = Event.find(params[:id])
    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @event.to_xml }
    end
  end

end

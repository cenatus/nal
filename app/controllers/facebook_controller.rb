class FacebookController < ApplicationController
  #ensure_authenticated_to_facebook

  layout 'application_facebook'

  def index
    @strands = Strand.order("sort_order ASC")
    @section = "festival"
    @related_events = Event.order("start_time ASC")

    respond_to do |format|
      format.html # index.haml
      format.xml { render :xml => @strands.to_xml }
    end
  end
end
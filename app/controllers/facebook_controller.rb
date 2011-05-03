class FacebookController < ApplicationController

  layout 'application_facebook'

  skip_before_filter :verify_authenticity_token

  def index
    @strands = Strand.order("sort_order ASC")
    @section = "festival"
    @related_events = Event.order("start_time ASC")

    respond_to do |format|
      format.html # index.haml
      format.xml { render :xml => @strands.to_xml }
    end
  end

    def privacy

    end

    def terms

  end

end
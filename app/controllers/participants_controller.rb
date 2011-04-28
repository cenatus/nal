class ParticipantsController < ApplicationController
  def index
    @performers = Performer.order("name ASC")
    @artists = Artist.order("name ASC")
    @speakers = Speaker.order("name ASC")
    @section = "festival"

    respond_to do |format|
      format.html # index.haml
      format.xml { render :xml => @participants.to_xml }
    end
  end

  def show
    @participant = Participant.find(params[:id])
    @section = "participant"

    @related_events = Event.order("start_time ASC")

    if !@participant.event.blank?
      @related_events = @related_events.reject {|event| event.id == @participant.event.id}
      @related_artist_events = [@participant.event]
    end

    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @participant.to_xml }
    end
  end

end

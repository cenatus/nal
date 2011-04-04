class ParticipantsController < ApplicationController
  def index
    @performers = Performer.order("created_at DESC")
    @artists = Artist.order("created_at DESC")
    @speakers = Speaker.order("created_at DESC")
    @section = "festival"

    respond_to do |format|
      format.html # index.haml
      format.xml { render :xml => @participants.to_xml }
    end
  end

  def show
    @participant = Participant.find(params[:id])
    @section = "festival"
    
    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @participant.to_xml }
    end
  end

end

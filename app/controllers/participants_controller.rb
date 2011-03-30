class ParticipantsController < ApplicationController
  def index
    @participants = Participant.order("created_at DESC")

    respond_to do |format|
      format.html # index.haml
      format.xml { render :xml => @participants.to_xml }
    end
  end

  def show
    @participant = Participant.find(params[:id])
    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @participant.to_xml }
    end
  end

end

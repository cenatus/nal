class StrandsController < ApplicationController
  def index
    @strands = Strand.order("sort_order DESC")
    @section = "festival"

    respond_to do |format|
      format.html # index.haml
      format.xml { render :xml => @strands.to_xml }
    end
  end

  def show
    @strand = Strand.find(params[:id])
    @section = "festival"
    
    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @strand.to_xml }
    end
  end

end

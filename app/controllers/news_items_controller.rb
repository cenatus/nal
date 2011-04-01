class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.order("created_at DESC")

    respond_to do |format|
      format.html # index.haml
      format.xml { render :xml => @news_items.to_xml }
    end
  end

  def show
    @news_item = NewsItem.find(params[:id])
    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @news_item.to_xml }
    end
  end

end

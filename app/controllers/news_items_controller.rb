class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    @tags = NewsItem.tag_counts_on(:tags)

    respond_to do |format|
      format.html # index.haml
      format.xml { render :xml => @news_items.to_xml }
      format.rss {
        @news_items = NewsItem.order("created_at DESC").limit(20)
        render :layout => false
      }
    end
  end

  def show

    if params[:old_id].blank?
      @news_item = NewsItem.find(params[:id])
    else
      # blog/195/listen-to-and-vote-for-the-submissions
      @news_item = NewsItem.find_by_old_id(params[:old_id])
    end
    
    @tags = NewsItem.tag_counts_on(:tags)
    
    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @news_item.to_xml }
    end
  end


  def tagged_with
    @news_items = NewsItem.tagged_with(params[:id]).paginate(:page => params[:page], :per_page => 5)

    @tags = NewsItem.tag_counts_on(:tags)

    respond_to do |format|
      format.html # index.haml
      format.xml { render :xml => @news_items.to_xml }
    end
  end

end

class SitemapController < ApplicationController

  def sitemap
    @news_items = NewsItem.all(:order => "updated_at DESC", :limit => 30)
    @strands = Strand.all(:order => "updated_at DESC")
    @events = Event.all(:order => "updated_at DESC", :limit => 20)
    @participants = Participant.all(:order => "updated_at DESC", :limit => 60)
    @pages = Page.all(:order => "updated_at DESC")

  end
end
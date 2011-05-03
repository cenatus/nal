class SearchController < ApplicationController
  def search
    # Pass any of the ActiveRecord find options to the search.
    @results_strands = Strand.find_with_index(params[:query],{:limit => 50})
    @results_news = NewsItem.find_with_index(params[:query],{:limit => 50})
    @results_events = Event.find_with_index(params[:query],{:limit => 50})
    @results_parts = Participant.find_with_index(params[:query],{:limit => 50})
    @results_pages = Page.find_with_index(params[:query],{:limit => 50})
  end
end
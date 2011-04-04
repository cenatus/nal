class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :twitter, :tags, :section

  def twitter
    require "twitter"
    begin
      @tweets = Twitter.user_timeline("netaudioldn", {:count => 5})
    rescue Exception => e
      logger.error("MSP error fetch tweets: #{e}")
    end
  end

  def tags
    @tags = []
  end

  def section
    @section = ""
  end
end

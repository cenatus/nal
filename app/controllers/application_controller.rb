class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :twitter

  def twitter
    require "twitter"
    begin
      @tweets = Twitter.user_timeline("netaudioldn", {:count => 5})
    rescue
#      yum yum
    end
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :twitter, :tags, :section, :lastfm

  def twitter
    require "twitter"
    begin
      @tweets = Rails.cache.fetch(:tweets, :expires_in => 10.minutes) do
        @tweets = Twitter.user_timeline("netaudioldn", {:count => 5})
      end
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

  def lastfm
    begin
      @lastfm_user_tracks = Rails.cache.fetch(:tracks, :expires_in => 10.minutes) do
        @lastfm_user_tracks = Scrobbler::User.new('polymorphic').recent_tracks
      end
    rescue Exception => e
      logger.error("MSP error fetch last.fm: #{e}")
    end


  end
end

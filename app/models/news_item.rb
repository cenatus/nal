class NewsItem < ActiveRecord::Base
  validates_presence_of :headline, :summary, :content
end

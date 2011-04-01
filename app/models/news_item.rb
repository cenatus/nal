class NewsItem < ActiveRecord::Base
  validates_presence_of :headline, :summary, :content

  has_many :assets
end

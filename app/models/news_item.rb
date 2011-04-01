class NewsItem < ActiveRecord::Base
  validates_presence_of :headline, :summary, :content

  has_and_belongs_to_many :assets
end

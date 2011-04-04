class NewsItem < ActiveRecord::Base
  validates_presence_of :headline, :summary, :content

  has_and_belongs_to_many :assets

  has_friendly_id :headline, :use_slug => true

  acts_as_taggable_on :tags
end

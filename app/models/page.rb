class Page < ActiveRecord::Base
  validates_presence_of :name, :slug
  has_many :content_areas
end

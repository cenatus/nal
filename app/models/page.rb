class Page < ActiveRecord::Base
  YEAR = Page.all.map{|a| a.year }.uniq.sort

  validates_presence_of :name, :slug, :year
  has_many :content_areas
end

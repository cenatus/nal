class Page < ActiveRecord::Base
  YEAR = Page.all.map{|a| a.year }.uniq.sort
#  SECTION = Page.all.map{|a| !a.section.blank? ? a.section : "" }.uniq.sort

  validates_presence_of :name, :slug, :year, :section
  has_many :content_areas
  has_and_belongs_to_many :assets

end

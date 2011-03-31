class Event < ActiveRecord::Base
  YEAR = Event.all.map{|a| a.year }.uniq.sort
  validates_presence_of :name, :summary, :detail, :year, :date

  belongs_to :strand

  has_many :performers
  has_many :artists
  has_many :speakers
  has_many :assets

end

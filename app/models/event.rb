class Event < ActiveRecord::Base
  YEAR = Event.all.map{|a| a.year }.uniq.sort
  validates_presence_of :name, :summary, :detail, :year

  belongs_to :strand

  has_many :performers
  has_many :artists
  has_many :speakers
  has_and_belongs_to_many :assets

  has_friendly_id :name, :use_slug => true

  acts_as_indexed :fields => [:name, :summary, :detail, :year]

  def strapline
    "#{self.timing} @ #{self.venue}"
  end

  def formatted(date)
    date.strftime("%A %d %b %Y, %H:%M")
  end

  def timing
    !self.start_time.blank? ? "#{formatted(self.start_time)}" : ""
  end

end

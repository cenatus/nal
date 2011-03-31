class Artist < Participant
  NAME = Artist.all.map{|a| a.name }.uniq.sort
  YEAR = Artist.all.map{|a| a.year }.uniq.sort
  EVENT = Artist.all.map{|a| !a.event.blank? ? a.event.name : "none"}.uniq.sort

  belongs_to :event
end
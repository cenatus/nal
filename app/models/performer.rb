class Performer < Participant
  NAME = Performer.all.map{|a| a.name }.sort
  YEAR = Performer.all.map{|a| a.year }.uniq.sort

  EVENT = Performer.all.map{|a| !a.event.blank? ? a.event.name : "none"}.uniq.sort
  
  belongs_to :event
end
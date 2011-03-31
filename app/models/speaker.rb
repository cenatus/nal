class Speaker < Participant
  NAME = Speaker.all.map{|a| a.name }.sort
  YEAR = Speaker.all.map{|a| a.year }.uniq.sort

  EVENT = Speaker.all.map{|a| !a.event.blank? ? a.event.name : "none"}.uniq.sort
  
  belongs_to :event
end
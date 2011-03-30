class Performer < Participant
  NAME = Performer.all.map{|a| a.name }.sort
end
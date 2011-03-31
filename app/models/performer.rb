class Performer < Participant
  NAME = Performer.all.map{|a| a.name }.sort
  YEAR = Performer.all.map{|a| a.year }.uniq.sort
end
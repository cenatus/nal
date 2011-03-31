class Artist < Participant
  NAME = Artist.all.map{|a| a.name }.uniq.sort
  YEAR = Artist.all.map{|a| a.year }.uniq.sort
end
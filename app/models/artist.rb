class Artist < Participant
  NAME = Artist.all.map{|a| a.name }.uniq.sort
end
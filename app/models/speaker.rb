class Speaker < Participant
  NAME = Speaker.all.map{|a| a.name }.sort
  YEAR = Speaker.all.map{|a| a.year }.uniq.sort
end
class Speaker < Participant
  NAME = Speaker.all.map{|a| a.name }.sort
end
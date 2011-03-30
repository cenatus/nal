class Participant < ActiveRecord::Base
  YEAR = Participant.all.map{|a| a.year }.uniq.sort
  validates :name, :presence => true
end
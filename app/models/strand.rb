class Strand < ActiveRecord::Base
  YEAR = Strand.all.map{|a| a.year }.uniq.sort
  validates_presence_of :name, :summary, :detail, :year

  has_many :events
end

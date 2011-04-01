class Strand < ActiveRecord::Base
  YEAR = Strand.all.map{|a| a.year }.uniq.sort
  validates_presence_of :name, :summary, :detail, :year

  has_many :events
  has_and_belongs_to_many :assets

end

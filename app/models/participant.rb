class Participant < ActiveRecord::Base
  validates :name, :presence => true
  validates :year, :presence => true
end
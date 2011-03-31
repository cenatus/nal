class Participant < ActiveRecord::Base
  validates :name, :presence => true
  validates :year, :presence => true

  belongs_to :event

end
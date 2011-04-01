class Participant < ActiveRecord::Base
  validates :name, :presence => true
  validates :year, :presence => true

  belongs_to :event
  has_and_belongs_to_many :assets
end
class Participant < ActiveRecord::Base
  validates :name, :presence => true
  validates :year, :presence => true

  has_many :assets
  belongs_to :event

  has_friendly_id :name, :use_slug => true
end
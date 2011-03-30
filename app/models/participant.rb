class Participant < ActiveRecord::Base
  validates :name, :presence => true
end
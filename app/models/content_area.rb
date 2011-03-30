class ContentArea < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :page
end

class Asset < ActiveRecord::Base
  NAME = Asset.all.map{|a| a.name }.uniq.sort
  validates_presence_of :name, :asset_file_name
  has_attached_file :asset, :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :bucket => 'nal.s3.amazonaws.com', :path => ":attachment/:id/:style.:extension", :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :thumb, :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :bucket => 'nal.s3.amazonaws.com', :path => ":attachment/:id/:style.:extension", :styles => { :medium => "300x300>", :thumb => "100x100>" }

#  :typus_preview and :typus_thumbnail

  belongs_to :page
  belongs_to :participant
  belongs_to :strand
  belongs_to :event
  belongs_to :news_item


end
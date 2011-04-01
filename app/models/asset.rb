class Asset < ActiveRecord::Base
  NAME = Asset.all.map{|a| a.name }.uniq.sort
  validates_presence_of :name, :asset_file_name
  has_attached_file :asset, :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :bucket => 'nal.s3.amazonaws.com', :path => ":attachment/:id/:style.:extension", :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :thumb, :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :bucket => 'nal.s3.amazonaws.com', :path => ":attachment/:id/:style.:extension", :styles => { :medium => "300x300>", :thumb => "100x100>" }

#  :typus_preview and :typus_thumbnail

  has_and_belongs_to_many :pages
  has_and_belongs_to_many :strands
  has_and_belongs_to_many :events
  has_and_belongs_to_many :news_items

  belongs_to :participant


end
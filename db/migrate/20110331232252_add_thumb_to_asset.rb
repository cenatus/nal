class AddThumbToAsset < ActiveRecord::Migration
  def self.up
    add_column :assets, :thumb_file_name, :string
    add_column :assets, :thumb_content_type, :string
    add_column :assets, :thumb_file_size, :integer
    add_column :assets, :thumb_updated_at, :datetime
    add_column :assets, :news_item_id, :integer
  end

  def self.down
    remove_column :assets, :thumb_file_name
    remove_column :assets, :thumb_content_type
    remove_column :assets, :thumb_file_size
    remove_column :assets, :thumb_updated_at
    remove_column :assets, :news_item_id
  end
end

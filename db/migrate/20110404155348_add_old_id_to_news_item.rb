class AddOldIdToNewsItem < ActiveRecord::Migration
  def self.up
    add_column :news_items, :old_id, :integer
  end

  def self.down
    remove_column :news_items, :old_id
  end
end

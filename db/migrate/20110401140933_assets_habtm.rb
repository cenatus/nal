class AssetsHabtm < ActiveRecord::Migration
  def self.up

#    has_and_belongs_to_many :pages
#    has_and_belongs_to_many :participants
#    has_and_belongs_to_many :strands
#    has_and_belongs_to_many :events
#    has_and_belongs_to_many :news_items

#    PAGES
    create_table :assets_pages, :id => false do |t|
      t.integer :asset_id
      t.integer :page_id

      t.timestamps
    end

    remove_column :assets, :page_id

#    PARTICIPANTS
#    create_table :assets_participants, :id => false do |t|
#      t.integer :asset_id
#      t.integer :participant_id
#
#      t.timestamps
#    end
#
#    remove_column :assets, :participant_id

#    STRAND
    create_table :assets_strands, :id => false do |t|
      t.integer :asset_id
      t.integer :strand_id

      t.timestamps
    end

    remove_column :assets, :strand_id

#    EVENTS
    create_table :assets_events, :id => false do |t|
      t.integer :asset_id
      t.integer :event_id

      t.timestamps
    end

    remove_column :assets, :event_id

#    NEWS_ITEMS
    create_table :assets_news_items, :id => false do |t|
      t.integer :asset_id
      t.integer :news_item_id

      t.timestamps
    end

    remove_column :assets, :news_item_id

  end

  def self.down
    drop_table :assets_pages
    add_column :assets, :page_id, :integer

#    drop_table :assets_participants
#    add_column :assets, :participant_id, :integer

    drop_table :assets_strands
    add_column :assets, :strand_id, :integer

    drop_table :assets_events
    add_column :assets, :event_id, :integer

    drop_table :assets_news_items
    add_column :assets, :news_item_id, :integer
  end
end

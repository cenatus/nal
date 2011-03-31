class Asset < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :name
      t.string :description
      t.string :asset_file_name
      t.string :asset_content_type
      t.integer :asset_file_size
      t.datetime :asset_updated_at

      t.integer :page_id
      t.integer :participant_id
      t.integer :strand_id
      t.integer :event_id

      t.string :style

      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end

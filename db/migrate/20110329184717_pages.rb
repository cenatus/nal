class Pages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name
      t.string :slug
      t.integer :sort_order

      t.timestamps
    end

    create_table :content_areas do |t|
      t.string :name
      t.string :content_type
      t.text :content
      t.integer :page_id

      t.timestamps
    end


  end

  def self.down
    drop_table :pages
    drop_table :content_areas
  end
end

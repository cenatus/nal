class RemoveContentAreas < ActiveRecord::Migration
  def self.up
    drop_table :content_areas

    add_column :pages, :content, :text

  end

  def self.down
    create_table :content_areas do |t|
      t.string :name
      t.string :content_type
      t.text :content
      t.integer :page_id

      t.timestamps
    end
  end
end

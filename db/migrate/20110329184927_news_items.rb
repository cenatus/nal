class NewsItems < ActiveRecord::Migration
  def self.up
    create_table "news_items" do |t|
      t.column "headline", :string
      t.column "summary", :text
      t.column "content", :text

      t.timestamps
    end

  end

  def self.down
    drop_table :news_items
  end
end

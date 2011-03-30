class Participant < ActiveRecord::Migration
  def self.up
    create_table :participants do |t|
      t.string :name
      t.text :biography
      t.string :homepage
      t.string :twitter_name
      t.integer :event_id
      t.string :type

      t.timestamps
    end

    
  end

  def self.down
    drop_table :participants
  end
end

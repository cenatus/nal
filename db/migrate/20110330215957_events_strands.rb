class EventsStrands < ActiveRecord::Migration
  def self.up
    create_table :strands do |t|
      t.string :name
      t.text :summary
      t.text :detail
      t.string :year
      t.integer :sort_order

      t.timestamps
    end
    create_table :events do |t|
      t.string :name
      t.string :venue
      t.date :date
      t.text :summary
      t.text :detail
      t.string :year
      t.integer :strand_id

      t.timestamps
    end

  end

  def self.down
    drop_table :strands
    drop_table :events
  end
end

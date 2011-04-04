class AddStartTimeToEvent < ActiveRecord::Migration
  def self.up
    remove_column :events, :date
    add_column :events, :start_time, :datetime
    add_column :events, :end_time, :datetime
  end

  def self.down
    remove_column :events, :start_time
    remove_column :events, :end_time
    add_column :events, :date, :date
  end
end

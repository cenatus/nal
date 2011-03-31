class AddSortOrderToParticipant < ActiveRecord::Migration
  def self.up
    add_column :participants, :sort_order, :integer
  end

  def self.down
    remove_column :participants, :sort_order
  end
end

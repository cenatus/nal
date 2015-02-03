class AddDefaultSortOrderToParticipant < ActiveRecord::Migration
  def self.up
    change_column_default(:participants, :sort_order, 0)

    Participant.connection.execute('UPDATE participants SET sort_order=0 WHERE sort_order is null')
  end

  def self.down
  end
end

class AddDefaultSortOrderToParticipant < ActiveRecord::Migration
  def self.up
    change_column_default(:participants, :sort_order, 0)
    Participant.reset_column_information
    Participant.find(:all).each do |p|
      p.update_attribute :sort_order, 0 if p.sort_order.blank?
    end
  end

  def self.down
  end
end

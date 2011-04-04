class AddFestivalFlagToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :section, :string, :default => "festival"
  end

  def self.down
    remove_column :pages, :section
  end
end

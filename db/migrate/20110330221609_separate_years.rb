class SeparateYears < ActiveRecord::Migration
  def self.up
    add_column :pages, :year, :string
    add_column :participants, :year, :string
  end

  def self.down
    remove_column :pages, :year
    remove_column :participants, :year
  end
end

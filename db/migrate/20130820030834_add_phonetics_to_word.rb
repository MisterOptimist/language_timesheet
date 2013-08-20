class AddPhoneticsToWord < ActiveRecord::Migration
  def self.up
    add_column :words, :phonetics, :text
  end

  def self.down
  	remove_column :words, :phonetics
end
end
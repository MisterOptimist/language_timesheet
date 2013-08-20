class AddExampleSentencesToWord < ActiveRecord::Migration
  def self.up
    add_column :words, :khmersentence, :text
    add_column :words, :englishsentence, :text
  end

  def self.down
  	remove_column :words, :khmersentence
  	remove_column :words, :englishsentence
end
end
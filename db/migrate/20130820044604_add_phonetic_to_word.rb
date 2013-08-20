class AddPhoneticToWord < ActiveRecord::Migration
  def self.up
    add_column :words, :phonetic, :text
  end

  def self.down
  	remove_column :words, :phonetic
end
end
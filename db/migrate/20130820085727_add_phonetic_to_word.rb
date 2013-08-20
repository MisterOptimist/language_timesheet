class AddPhoneticToWord < ActiveRecord::Migration
  def change
  add_column :words, :phonetic, :text

  end
end

class AddEnglishPhoneticToWords < ActiveRecord::Migration
  def change
    add_column :words, :english_phonetic, :string
  end
end
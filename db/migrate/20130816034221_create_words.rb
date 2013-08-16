class CreateWords < ActiveRecord::Migration
  def self.up
    create_table :words do |t|
      t.string :khmer
      t.string :english
      t.date :rndm

      t.timestamps
    end
    def self.down
    drop_table :words
  end
  end
end

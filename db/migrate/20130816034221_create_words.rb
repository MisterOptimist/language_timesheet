class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :khmer
      t.string :english
      t.date :rndm

      t.timestamps
    end
  end
end

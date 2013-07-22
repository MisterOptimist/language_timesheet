class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.decimal :teacher
      t.decimal :study
      t.decimal :conversation
      t.date :day
      t.references :user

      t.timestamps
    end
    add_index :timesheets, :user_id
  end
end

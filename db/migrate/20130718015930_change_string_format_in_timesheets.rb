class ChangeStringFormatInTimesheets < ActiveRecord::Migration
  def self.up
  	change_column :timesheets, :day, :date
  end

  def self.down 
  	change_column :timesheets, :day, :string
  end
end

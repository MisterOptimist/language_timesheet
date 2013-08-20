class AddDateStaffedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :joined_staff, :date
  end
end

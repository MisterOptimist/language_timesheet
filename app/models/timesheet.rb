class Timesheet < ActiveRecord::Base
  belongs_to :user
  attr_accessible :conversation, :day, :study, :teacher, :user_id
end

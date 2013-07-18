class Timesheet < ActiveRecord::Base
  belongs_to :user
  attr_accessible :conversation, :day, :study, :teacher, :user_id
  validates_presence_of :teacher, :study, :conversation, :day
  validates_numericality_of :teacher, :greater_than_or_equal_to => 0.01, :less_than => 10
  validates_numericality_of :study, :greater_than_or_equal_to => 0.01, :less_than => 10
  validates_numericality_of :conversation, :greater_than_or_equal_to => 0.01, :less_than => 10
end

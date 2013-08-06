class Timesheet < ActiveRecord::Base
  include PublicActivity::Common


  belongs_to :user
  attr_accessible :conversation, :day, :study, :teacher, :user_id
  validates_presence_of :teacher, :study, :conversation, :day
  validates_numericality_of :teacher, :greater_than_or_equal_to => 0.00, :less_than => 10
  validates_numericality_of :study, :greater_than_or_equal_to => 0.00, :less_than => 10
  validates_numericality_of :conversation, :greater_than_or_equal_to => 0.00, :less_than => 10





  def hours_studied
  	teacher + study + conversation
  end


  def self.last_week
  where(:day => 1.week.ago.beginning_of_week..1.week.ago.end_of_week)
end

end

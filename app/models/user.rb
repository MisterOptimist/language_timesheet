class User < ActiveRecord::Base

  after_create :assign_default_role
	has_many :timesheets
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :joined_staff


 #When user signs up, automatically assigns them as Staff
  def assign_default_role
    add_role(:new_staff) if self.roles.blank? && self.joined_staff.to_date > 1.year.ago.to_date
    add_role(:staff) if self.roles.blank? && self.joined_staff.to_date > 1.year.ago.to_date
end

  #Required for Forem
  def to_s
  name
  end

 def add_hours
  self.timesheets.where('day BETWEEN ? AND ?', Date.today.beginning_of_week, Date.today.end_of_week).order('created_at DESC').sum{|p| p.teacher + p.conversation + p.study}

 end
  
end

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
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :joined_staff


 #When user signs up, automatically assigns them as Staff
  def assign_default_role
    if self.roles.blank?
      if self.joined_staff.to_date <= 1.year.ago.to_date
        add_role(:staff)
      else
        add_role(:new_staff)
      end
    end
end

  #Required for Forem
  def to_s
  name
  end
  
#Calculates the total hours a person has studied from 3 different columns and adds them together.
  def total_hours                                                                    
  @total_hours ||= timesheets                                                   
    .where('day BETWEEN ? AND ?', Date.today.beginning_of_week, Date.today.end_of_week)
    .sum {|p| p.teacher + p.conversation + p.study}                             
  end                                                                             

#Checks the progress of the user and outputs different colored tables for admin use
def progress_status                                                             
  if has_role? :staff                                                           
    if total_hours >= 10                                                           
      :success                                                                     
    elsif (7..9).include? total_hours                                           
      :warning                                                                     
    else                                                                           
      :error                                                                       
    end                                                                                                                                         
  elsif has_role? :new_staff                                                       
    if total_hours >= 15                                                           
      :success                                                                     
    elsif (12..14).include? total_hours                                            
      :warning                                                                     
    else                                                                           
      :error
    end
  end
end

#Set this so users won't have to confirm their email when sigining up.
  protected
    def confirmation_required?
      false
      end
  
end

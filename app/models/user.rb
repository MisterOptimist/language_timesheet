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
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me


  def assign_default_role
    add_role(:staff) if self.roles.blank?
  end

  def to_s
  name
  end

 
  
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # To facilitate username or email login
  attr_accessor :login

  # Setup accessible (or protected) attributes for your model
  attr_accessible :id, :name, :username, :email, :password, :password_confirmation, :remember_me
  
  validates :name,  :presence => true
  validates :email,  :presence => true
    
  scope :recent_by_sign_in, order("user.last_sign_in_at")   
  
  def self.current
    Thread.current[:user]
  end
  
  def self.current=(user)
    Thread.current[:user] = user
  end  
  
end
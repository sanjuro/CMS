class Client < ActiveRecord::Base
  
  attr_accessible :client_number, :client_type, :registered_name, :id_number,
                  :telephone_work, :telephone_home, :email_address,
                  :telephone_mobile, :passport_number, :created_at, 
                  :updated_at
                  
  validates :registered_name,  :presence => true  
  validates :id_number,  :presence => true                  
  
  has_many :locations, :dependent => :destroy
  has_many :installations, :dependent => :destroy
  
  before_create :generate_client_number
  
  def generate_client_number
    record = true
    while record
      random = "C#{Array.new(9){rand(9)}.join}"
      record = self.class.find(:first, :conditions => ["client_number = ?", random])
    end
    self.client_number = random if self.client_number.blank?
    self.client_number
  end
  
end
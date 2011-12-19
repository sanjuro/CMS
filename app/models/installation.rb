class Installation < ActiveRecord::Base
  
  attr_accessible :id, :installation_number, :installation_type, :client_id, 
                  :cost_total, :selling_total, :user_id, :created_at, 
                  :updated_at
                  
  belongs_to :client, :foreign_key => "client_id", :class_name => "Client"
  belongs_to :user, :foreign_key => "user_id", :class_name => "User"
  
  has_one :installation_type                 
                  
  has_many :installation_items, :dependent => :destroy    
  has_many :installer
             
  before_create :generate_installation_number
  
  def generate_installation_number
    record = true
    while record
      random = "I#{Array.new(9){rand(9)}.join}"
      record = self.class.find(:first, :conditions => ["installation_number = ?", random])
    end
    self.installation_number = random if self.installation_number.blank?
    self.installation_number
  end  
   
end
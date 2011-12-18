class Installation < ActiveRecord::Base
  
  attr_accessible :id, :installation_number, :installation_type, 
                  :cost_total, :selling_total, :created_at, 
                  :updated_at
                  
  belongs_to :installation_type                 
                  
  has_many :installation_items, :dependent => :destroy    
             
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
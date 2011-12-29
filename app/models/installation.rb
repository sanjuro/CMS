class Installation < ActiveRecord::Base
  
  attr_accessible :id, :installation_number, :installation_type_id, :client_id, 
                  :cost_total, :selling_total, :voucher_number, :created_at, 
                  :decoder_number_one, :decoder_number_two,
                  :smartcard_number_one, :smartcard_number_two,
                  :lnb_no, :lnb_type, 
                  :updated_at, :installation_items_attributes
                  
  belongs_to :client, :foreign_key => "client_id", :class_name => "Client"
  
  belongs_to :installation_type                 
                  
  has_many :installation_items, :dependent => :destroy    
  has_many :installers
  
  accepts_nested_attributes_for :installation_items, :allow_destroy => true
             
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
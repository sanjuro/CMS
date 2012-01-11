class Installation < ActiveRecord::Base
 
  acts_as_commentable   
  
  attr_accessible :id, :installation_number, :installation_type_id, :client_number, :client_id,
                  :cost_total, :selling_total, :voucher_number,  
                  :decoder_number_one, :decoder_number_two,
                  :smartcard_number_one, :smartcard_number_two,
                  :lnb_no, :lnb_type_id, :installer_ids,
                  :updated_at, :created_at, :installation_items_attributes
 
  validates :installation_number, :presence => true,
                                  :uniqueness => true, :on => :create
  validates :client_number, :presence => true
  validates :decoder_number_one, :presence => true
  validates :smartcard_number_one, :presence => true
                  
  belongs_to :client, :primary_key => :client_number , :foreign_key => :client_number   
  belongs_to :installation_type
  belongs_to :lnb_type          
                  
  has_many :installation_items, :dependent => :destroy    
  has_and_belongs_to_many :installers
  
  accepts_nested_attributes_for :installation_items, :allow_destroy => true
             
  before_create :generate_installation_number
  
  def self.search(search,type)
    if search
      where('installation_number LIKE ? OR client_id LIKE ? ', "%#{search}%","%#{search}%")                                
    else
      scoped
    end        
  end
  
  def self.count_on(date)
    where("date(created_at) = ?",date).count(:id)
  end
  
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
class SmpRep < ActiveRecord::Base
  
  acts_as_commentable
  
  attr_accessible :id, :smp_rep_code, :title, :name, :surname, :contact_number
  
  validates :smp_rep_code, :uniqueness => true, :on => :create
  validates :name, :presence => true, 
                               :length => {
                                  :minimum   => 3,
                                  :maximum   => 20,
                                  :too_short => "must have at least %{count} characters",
                                  :too_long  => "must have at most %{count} characters"
                                } 
  validates :surname, :presence => true, 
                               :length => {
                                  :minimum   => 3,
                                  :maximum   => 20,
                                  :too_short => "must have at least %{count} characters",
                                  :too_long  => "must have at most %{count} characters"
                                }    
                                
  validates :contact_number, :presence => true,                            
                             :length => { :minimum => 9 }
                               
  has_many :clients
  
  before_create :generate_smp_rep_code
  
  def self.search(search,type)
    if search
      where('name LIKE ? OR surname LIKE ? OR smp_rep_code LIKE ?', "%#{search}%","%#{search}%","%#{search}%")                                
    else
      scoped
    end        
  end  
  
  def generate_smp_rep_code
    record = true
    while record
      random = "SR#{Array.new(8){rand(8)}.join}"
      record = self.class.find(:first, :conditions => ["smp_rep_code = ?", random])
    end
    self.smp_rep_code = random if self.smp_rep_code.blank?
    self.smp_rep_code
  end
  
  def fullname
    self.title + ' ' + self.name + ' ' + self.surname
  end  
  
end
class Installer < ActiveRecord::Base
  
  acts_as_commentable
  
  attr_accessible :id, :installer_number, :name, :surname, :contact_number
  
  validates :installer_number, :uniqueness => true, :on => :create
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
                               
  has_and_belongs_to_many :installations  
  
  def self.search(search,type)
    if search
      where('name LIKE ? OR surname LIKE ? OR installer_number LIKE ?', "%#{search}%","%#{search}%","%#{search}%")                                
    else
      scoped
    end        
  end
  
  def generate_installer_number
    record = true
    while record
      random = "IS#{Array.new(8){rand(8)}.join}"
      record = self.class.find(:first, :conditions => ["installer_number = ?", random])
    end
    self.installer_number = random if self.installer_number.blank?
    self.installer_number
  end
  
  def fullname
    self.name + ' ' + self.surname
  end
                
end
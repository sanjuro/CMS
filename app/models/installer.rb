class Installer < ActiveRecord::Base
  
  attr_accessible :id, :firstname, :surname, :contact_number
                  
  belongs_to :installation_type                 
                  
  has_many :installations  
              
   
end
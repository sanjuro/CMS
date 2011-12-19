class Installer < ActiveRecord::Base
  
  attr_accessible :id, :first_name, :second_name, :contact_number
                  
  has_many :installations  
                
end
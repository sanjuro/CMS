class Location < ActiveRecord::Base
  
  attr_accessible :client_id, :unit_number, :street_name, :suburb, :city,
                  :province, :postal_code, :latitude, :longitude
                 
  belongs_to :client      
             
                  
end
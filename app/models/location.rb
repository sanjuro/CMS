class Location < ActiveRecord::Base
  
  attr_accessible :unit_number, :street_name, :suburb, :city,
                  :province, :postal_code, :latitude, :longitude
                 
  belongs_to :client                   
                  
end
class InstallationItem < ActiveRecord::Base
  
  attr_accessible :id, :installation_id, :product_id
                  :quantity, :cost_price, :selling_price
  
  belongs_to :installation
  
  has_one :product 
                  
end
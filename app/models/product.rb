class Product < ActiveRecord::Base
  
  attr_accessible :id, :product_type, :product_code, :product_name
                  :product_description, :cost_price :selling_price
                  
  belongs_to :product_type      
  
  has_many :images, :as => :viewable, :order => :position, :dependent => :destroy
  
  def product_images
    Image.find_by_sql("SELECT assets.* FROM assets LEFT JOIN products ON (product.id = asset.viewable_id) WHERE (product_id = #{self.id})")
  end             
                  
end
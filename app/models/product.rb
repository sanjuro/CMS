class Product < ActiveRecord::Base

  acts_as_commentable
  
  attr_accessible :id, :product_type, :product_code, :product_name, :stock_level,
  					:meta_keywords, :meta_description,
                  	:product_description, :cost_price, :wholesale_price, :selling_price
                  
  belongs_to :product_type      
  
  has_many :images, :as => :viewable, :order => :position, :dependent => :destroy

  searchable do
    text :product_name, :stored => true, :boost => 5
    string :product_code
  end
  
  def product_images
    Image.find_by_sql("SELECT assets.* FROM assets LEFT JOIN products ON (product.id = asset.viewable_id) WHERE (product_id = #{self.id})")
  end             
                  
end
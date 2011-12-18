class CreateCms < ActiveRecord::Migration
  
  def self.up
    create_table :client, :options => "ENGINE=INNODB" do |t|
      t.references :client_type
      t.string :client_number
      t.string :registered_name
      t.string :id_number
      t.string :telephone_home
      t.string :telephone_work
      t.string :telephone_mobile
      t.string :email_address
      t.string :passport_number
      
      t.timestamps
    end
    
    create_table :client_type, :options => "ENGINE=INODB" do |t|
      t.string :title
    end
    
    create_table :installation, :options => "ENGINE=INNODB" do |t|
      t.references :installation_type
      t.string :installation_number
      t.decimal "cost_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal "selling_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
      
      t.timestamps
    end
    
    add_index "installation", ["installation_number"], :name => "index_installation_on_installation_number"        
    
    create_table "installation_item", :force => true do |t|
      t.references :installation
      t.references :product
      t.integer :quantity
      t.decimal  :cost_totatl,            :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal  :selling_total,             :precision => 8, :scale => 2, :default => 0.0, :null => false
      
      t.timestamps
    end   
    
    add_index "installation_item", ["installation_id"], :name => "index_installation_items_on_installation_id"
    add_index "installation_item", ["product_id"], :name => "index_installation_items_on_product_id"     
    
    create_table :installation_type, :options => "ENGINE=INODB" do |t|
      t.string :title
    end    

    create_table :location, :options => "ENGINE=INODB" do |t|
      t.references :client
      t.string :unit_number
      t.string :street_name
      t.string :suburb
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :latitude
      t.string :longitude

      t.timestamps
    end  
    
    create_table "product", :force => true do |t|
      t.references :product_type
      t.string "product_name", :default => "", :null => false
      t.string "product_code"
      t.text "product_description"
      t.decimal "cost_price", :precision => 8, :scale => 2, :null => true
      t.decimal "selling_price", :precision => 8, :scale => 2, :null => false
      t.datetime "available_on"
      t.datetime "deleted_at"
      t.string "meta_description"
      t.string "meta_keywords"
      
      t.timestamps
    end    
    
    create_table :product_type, :options => "ENGINE=INODB" do |t|
      t.string :title
    end 
  end

  def self.down
    
  end
end
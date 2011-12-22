class CreateCmsDb < ActiveRecord::Migration
  
  def self.up
    create_table :clients, :options => "ENGINE=INNODB" do |t|
      t.references :client_type
      t.string :client_number
      t.string :registered_name
      t.string :id_number
      t.string :telephone_home
      t.string :telephone_work
      t.string :telephone_mobile
      t.string :email_address
      t.string :passport_number
      t.string :unit_number
      t.string :street_name
      t.string :suburb
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :latitude
      t.string :longitude
      t.boolean :is_smp, :default => false
      t.string :smp_number
      
      t.timestamps
    end
    
    create_table :client_types, :options => "ENGINE=INODB" do |t|
      t.string :title
    end
    
    create_table :installers, :options => "ENGINE=INODB" do |t|
      t.string :first_name
      t.string :second_name
      t.string :contact_number
      
      t.timestamps
    end  
    
    create_table :installations, :options => "ENGINE=INNODB" do |t|
      t.references :installation_type
      t.references :client
      t.references :user
      t.string :installation_number
      t.decimal "cost_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal "selling_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
      
      t.timestamps
    end
    
    add_index "installations", ["installation_number"], :name => "index_installation_on_installation_number"        
    add_index "installations", ["client_id"], :name => "index_installation_on_client"  
    
    create_table "installation_items", :force => true do |t|
      t.references :installation
      t.references :product
      t.integer :quantity
      t.decimal  :cost_price,            :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal  :selling_price,             :precision => 8, :scale => 2, :default => 0.0, :null => false
      
      t.timestamps
    end   
    
    add_index "installation_items", ["installation_id"], :name => "index_installation_items_on_installation_id"
    add_index "installation_items", ["product_id"], :name => "index_installation_items_on_product_id"     
    
    create_table :installation_types, :options => "ENGINE=INODB" do |t|
      t.string :title
    end    
    
    create_table "products", :force => true do |t|
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
    
    create_table :product_types, :options => "ENGINE=INODB" do |t|
      t.string :title
    end 
  end

  def self.down
    
  end
end
class CreateCmsDb < ActiveRecord::Migration
  
  def self.up
    create_table :clients, :options => "ENGINE=INNODB" do |t|
      t.references :client_type
      t.references :industry_type
      t.string :client_number, :unique => true
      t.string :title
      t.string :initials
      t.string :name
      t.string :surname
      t.string :id_number
      t.boolean :is_smp, :default => false
      t.string :smp_number    
      t.string :smp_rep_code 
      t.string :telephone_home
      t.string :fax
      t.string :mobile_number_one
      t.string :mobile_number_two
      t.string :email_address
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
    
    add_index :clients, :client_number, :unique => true
    add_index :clients, :smp_rep_code, :unique => true
    
    create_table :client_types, :options => "ENGINE=INODB" do |t|
      t.string :title
    end
    
    create_table :industry_types, :options => "ENGINE=INODB" do |t|
      t.string :title
    end
    
    IndustryType.create!(:title => 'Agriculture')
    IndustryType.create!(:title => 'Construction')
    IndustryType.create!(:title => 'Finance')
    IndustryType.create!(:title => 'Government')
    IndustryType.create!(:title => 'Health Care')
    IndustryType.create!(:title => 'Information Technology')
    IndustryType.create!(:title => 'Insurance')
    IndustryType.create!(:title => 'Manufacturing')
    IndustryType.create!(:title => 'Real Estate')
    IndustryType.create!(:title => 'Retail, Wholesale')
    IndustryType.create!(:title => 'Services')
    IndustryType.create!(:title => 'Transportation')
    IndustryType.create!(:title => 'Communications, Utilities')
    IndustryType.create!(:title => 'Nonprofit')
    
    create_table :installers, :options => "ENGINE=INODB" do |t|
      t.string :installer_number
      t.string :name
      t.string :surname
      t.string :contact_number
      
      t.timestamps
    end  
    
    Installer.create!(:installer_number => 'IS12341234', :name => 'Test', :surname => 'Installer1', :contact_number => '0831231212')
    Installer.create!(:installer_number => 'IS12341235', :name => 'Test', :surname => 'Installer2', :contact_number => '0831231212')
    Installer.create!(:installer_number => 'IS12341236', :name => 'Test', :surname => 'Installer3', :contact_number => '0831231212')
    
    create_table :installations_installers, :id => false  do |t|
      t.integer :installer_id
      t.integer :installation_id
    end

    create_table :installations, :options => "ENGINE=INNODB" do |t|
      t.references :installation_type
      t.references :lnb_type
      t.references :client
      t.string :installation_number
      t.string :client_number
      t.string :multichoice_number
      t.string :financial_number
      t.string :voucher_number
      t.string :decoder_number_one
      t.string :decoder_number_two
      t.string :smartcard_number_one
      t.string :smartcard_number_two
      t.string :lnb_no 
      t.decimal "cost_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal "selling_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.datetime "installation_at"
      
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
    
    InstallationType.create!(:title => 'TopTV')
    InstallationType.create!(:title => 'Samsat')
    InstallationType.create!(:title => 'Space')
    InstallationType.create!(:title => 'Sos Audio Visual')
    InstallationType.create!(:title => 'Multichoice')
    InstallationType.create!(:title => 'Big Bay')
    InstallationType.create!(:title => 'PVT')
    InstallationType.create!(:title => 'Ellies')
    
    create_table :lnb_types, :options => "ENGINE=INODB" do |t|
      t.string :title
    end
    
    LnbType.create!(:title => 'Single')
    LnbType.create!(:title => 'Twin')
    LnbType.create!(:title => '4x4')
    LnbType.create!(:title => 'Quad')
    LnbType.create!(:title => 'SatCR')
    
    create_table "products", :force => true do |t|
      t.references :product_type
      t.string "product_name", :default => "", :null => false
      t.string "product_code"
      t.text "product_description"
      t.decimal "cost_price", :precision => 8, :scale => 2, :null => true
      t.decimal "wholesale_price", :precision => 8, :scale => 2, :null => false
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
    
    create_table :smp_reps, :options => "ENGINE=INODB" do |t|
      t.string :smp_rep_code, :unique => true
      t.string :title
      t.string :name
      t.string :surname
      t.string :contact_number
       
      t.timestamps
    end 
  end

  def self.down
    
  end
end
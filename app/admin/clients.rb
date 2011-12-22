# app/admin/clients.rb
ActiveAdmin.register Client do  

  # Create sections on the index screen
  scope :all, :default => true
 
  # filter :order_items, :as => :select, :collection => lambda{ Order.order_items }
  filter :client_number
  filter :registered_name
  filter :street_name

  # Customize columns displayed on the index screen in the table
  index do
    column :client_number
    column :registered_name
    column :street_name
    default_actions   
  end
  
  show do
    panel "Client Details" do
      attributes_table_for client do
        row("Number") { client.client_number }
        row("Name") { client.registered_name }
        row("ID Number") { client.id_number }  
        row("SMP") { client.is_smp }     
        row("Street") { client.street_name }  
        row("Created At") { client.created_at }
      end
    end
    
    panel "Contact Details" do
      attributes_table_for client do
        row("Telephone Home") { client.telephone_home }
        row("Telephone Work") { client.telephone_work }
        row("Telephone Mobile") { client.telephone_mobile }
        row("Email Address") { client.email_address }
      end
    end
      
    panel "Location Details" do
      attributes_table_for client do
          row("Unit Number") { client.unit_number }
          row("Street Name") { client.street_name }
          row("Suburb") { client.suburb}
          row("City") { client.city }
          row("Province") { client.province }
          row("Postal Code") { client.postal_code }
          row("Latitude") { client.latitude}
          row("Longitude") { client.longitude }
      end
    end 
    
    active_admin_comments  
  end  
  
  form do |f|
    f.inputs "Details" do
      f.input :registered_name
      f.input :id_number, :label => 'ID Number'
      f.input :is_smp
      f.input :smp_number, :label => 'SMP Number'
      f.input :created_at
    end
    f.inputs "Contact" do
      f.input :telephone_home  
      f.input :telephone_work  
      f.input :telephone_mobile 
      f.input :email_address 
    end
    f.inputs "Location" do
      f.input :unit_number
      f.input :street_name
      f.input :suburb
      f.input :city
      f.input :province
      f.input :postal_code
      f.input :latitude
      f.input :longitude
    end
    f.buttons
  end  
  
  action_item :only => :show do 
    link_to('New Installation', new_admin_installation_path)
  end     

end
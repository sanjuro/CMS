# app/admin/clients.rb
ActiveAdmin.register Client do  

  # Create sections on the index screen
  scope :all, :default => true
 
  # filter :order_items, :as => :select, :collection => lambda{ Order.order_items }
  filter :registered_name
  filter :email_address

  # Customize columns displayed on the index screen in the table
  index do
    column :client_number
    column :registered_name
    column :email_address
    default_actions   
  end
  
  show do
    panel "Client Details" do
      attributes_table_for client do
        row("Number") { client.client_number }
        row("Name") { client.registered_name }
        row("ID Number") { client.id_number }  
        row("SMP") { client.is_smp }      
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
  end  
  
  form do |f|
    f.inputs "Details" do
      f.input :client_number
      f.input :registered_name
      f.input :id_number
      f.input :is_smp
      f.input :created_at
    end
    f.inputs "Contact" do
      f.input :telephone_home  
      f.input :telephone_work  
      f.input :telephone_mobile 
      f.input :email_address 
    end
    f.inputs :name => 'Location #%i', :for => :locations
    f.buttons
  end  

end
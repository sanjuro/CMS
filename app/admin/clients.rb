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
    column :surname
    column :street_name
    default_actions   
  end
  
  show do
    panel "Client Details" do
      attributes_table_for client do
        row("Number") { client.client_number }
        row("Title") { client.title }
        row("Name") { client.name }
        row("Surname") { client.surname }
        row("ID Number") { client.id_number }  
        row("Created At") { client.created_at }
      end
    end
    
    panel "Contact Details" do
      attributes_table_for client do
        row("Telephone Home") { client.telephone_home }
        row("Telephone Mobile 1") { client.mobile_number_one }
        row("Telephone Mobile 2") { client.mobile_number_two }
        row("Fax") { client.fax }
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
      f.input :title
      f.input :initials
      f.input :name
      f.input :surname
      f.input :id_number, :label => 'ID Number'
      f.input :is_smp
      f.input :smp_number, :label => 'SMP Number'
      f.input :smp_rep_code, :label => 'SMP Rep Code'
      f.input :created_at
    end
    f.inputs "Contact" do
      f.input :telephone_home, :label => 'Home No.'
      f.input :mobile_number_one, :label => 'Cell No. 1'  
      f.input :mobile_number_two, :label => 'Cell No. 2'  
      f.input :fax, :label => 'Fax No.' 
      f.input :email_address, :label => 'Email' 
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
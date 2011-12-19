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

end
# app/admin/users.rb
ActiveAdmin.register Clients do  

  # Create sections on the index screen
  scope :all, :default => true
 
  # filter :order_items, :as => :select, :collection => lambda{ Order.order_items }
  filter :firstname
  filter :surname
  filter :email_address

  # Customize columns displayed on the index screen in the table
  index do
    column :client_number
    column :firstname
    column :surname
    column :email_address
    default_actions   
  end

end
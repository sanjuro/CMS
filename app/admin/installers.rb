# app/admin/installations.rb
ActiveAdmin.register Installer do  

  # Create sections on the index screen
  scope :all, :default => true
 
  # filter :order_items, :as => :select, :collection => lambda{ Order.order_items }
  filter :first_name
  filter :second_name

  # Customize columns displayed on the index screen in the table
  index do
    column :id
    column :first_name
    column :second_name
    column :created_at
    default_actions   
  end

end
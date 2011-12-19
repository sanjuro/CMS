# app/admin/installations.rb
ActiveAdmin.register Installation do  

  # Create sections on the index screen
  scope :all, :default => true
 
  # filter :order_items, :as => :select, :collection => lambda{ Order.order_items }
  filter :created_at

  # Customize columns displayed on the index screen in the table
  index do
    column :installation_number
    column :installation_type_id
    column :cost_total
    column :selling_total
    column :created_at
    default_actions   
  end

end
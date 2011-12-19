# app/admin/users.rb
ActiveAdmin.register User do  

  # Create sections on the index screen
  scope :all, :default => true
 
  # filter :order_items, :as => :select, :collection => lambda{ Order.order_items }
  filter :email
  filter :name
  filter :created_at

  # Customize columns displayed on the index screen in the table
  index do
    column :id
    column :name
    column :email
    column :last_sign_in_at
    default_actions   
  end

  form do |f|
    f.inputs "Details" do
      f.input :email
      f.input :name
      f.input :username
      f.input :password, :type => :password
    end
    f.buttons
  end 
  
end

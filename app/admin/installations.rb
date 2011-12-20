# app/admin/installations.rb
ActiveAdmin.register Installation do  

  # Create sections on the index screen
  scope :all, :default => true
 
  # filter :order_items, :as => :select, :collection => lambda{ Order.order_items }
  filter :installation_number
  filter :installation_type, :as => :select 
  filter :created_at

  # Customize columns displayed on the index screen in the table
  index do
    column :installation_number
    column :installation_type
    column :cost_total
    column :selling_total
    column :created_at
    default_actions   
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :installation_type
      f.input :client
      f.input :user
      f.input :cost_total
      f.input :selling_total
      f.input :created_at
    end  
    f.inputs "Installation Items" do
      f.has_many :installation_items do |i|
        i.input :_destroy, :as => :boolean, :label => "Delete this item" unless i.object.id.nil?
        i.input :product_id
        i.input :quantity
        i.input :cost_price
        i.input :selling_price
      end
    end
  end

end
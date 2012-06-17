class AddCreatedBy < ActiveRecord::Migration
  def self.up
    add_column :clients, :created_by, :integer
   
    add_index :clients, ["created_by"], :name => "fk_clients_user"
  end
   
  def self.down
    remove_column :clients, :created_by
  end
end
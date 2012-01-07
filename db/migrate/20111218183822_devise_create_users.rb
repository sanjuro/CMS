class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|     
      
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.string :name
      t.string :username

      t.timestamps
    end

    # Create a default user
    User.create!(:email => 'shad6ster@gmail.com', :name => 'shadley', :username => 'sanjuro', :password => 'rad6hia', :password_confirmation => 'rad6hia')
    
    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :user, :confirmation_token,   :unique => true
    # add_index :user, :unlock_token,         :unique => true
    # add_index :user, :authentication_token, :unique => true
    
  end

  def self.down
    drop_table :users
  end
end

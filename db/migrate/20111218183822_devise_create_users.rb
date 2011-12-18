class DeviseCreateUser < ActiveRecord::Migration
  def self.up
    create_table(:user) do |t|
      t.references :client      
      
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

    add_index :user, :email,                :unique => true
    add_index :user, :reset_password_token, :unique => true
    # add_index :user, :confirmation_token,   :unique => true
    # add_index :user, :unlock_token,         :unique => true
    # add_index :user, :authentication_token, :unique => true
    
  end

  def self.down
    drop_table :user
  end
end

require 'spec_helper'

describe Client do
  
  before(:each) do 
    @attr = { :client_number => 'C333427046', :title => 'Mr', :name => "Test", :surname => "Client", :email_address => "test@eaxmple.com" }
  end
  
  it "should create a new instance given valid attributes" do 
    Client.create!(@attr)
  end
    
  it "should require a name" do
   no_name_client = Client.new(@attr.merge(:name => ""))
   no_name_client.should_not be_valid
  end
  
  it "should require a surname" do
   no_surname_client = Client.new(@attr.merge(:surname => ""))
   no_surname_client.should_not be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_client = Client.new(@attr.merge(:name => long_name))
    long_name_client.should_not be_valid
  end
  
  it "should reject surnames that are too long" do
    long_surname = "a" * 51
    long_surname_client = Client.new(@attr.merge(:surname => long_surname))
    long_surname_client.should_not be_valid
  end
  
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_client = Client.new(@attr.merge(:email_address => address))
      valid_email_client.should be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_client = Client.new(@attr.merge(:email_address => address))
      invalid_email_client.should_not be_valid
    end
  end
  
  it "should reject duplicate client numbers" do
    Client.create!(@attr)
    client_with_duplicate_client_number = Client.new(@attr)
    client_with_duplicate_client_number.should_not be_valid
  end
  
  it "should produce the full name of the installer" do
    client = Client.new(@attr.merge(:contact_number => ""))
    client.fullname.should  == 'Mr Test Client'
  end
  
end
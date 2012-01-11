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
  
  it "should reject duplicate client numbers" do
    Client.create!(@attr)
    client_with_duplicate_client_number = Client.new(@attr)
    client_with_duplicate_client_number.should_not be_valid
  end
  
  it "should produce the full name of the installer" do
    client = Client.new(@attr)
    client.full_name.should  == 'Mr Test Client'
  end
  
  it "should produce the full address of the installer" do
    client = Client.new(@attr.merge(:unit_number => "31", :street_name => "Rickets Street", :suburb => "Parow", :city => "Cape Town" ))
    client.full_address.should  == '31 Rickets Street, Parow, Cape Town, '
  end
  
end
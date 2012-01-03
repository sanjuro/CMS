require 'spec_helper'

describe Installation do

  before(:each) do 
    @attr = { :installation_number => 'I333427046', :client_id => 1, :decoder_number_one => "D123123123", :smartcard_number_one => "S123123123" }
  end
  
  it "should create a new instance given valid attributes" do 
    Installation.create!(@attr)
  end
  
  it "should require a installation number" do
    no_installation_number_installation = Installation.new(@attr.merge(:installation_number => ""))
    no_installation_number_installation.should_not be_valid
  end
  
  it "should require a client id" do
    no_client_id_installation = Installation.new(@attr.merge(:client_id => ""))
    no_client_id_installation.should_not be_valid
  end  
  
  it "should require a decoder number one" do
    no_decoder_number_one_installation = Installation.new(@attr.merge(:decoder_number_one => ""))
    no_decoder_number_one_installation.should_not be_valid
  end  
  
  it "should require a smartcard number one" do
    no_smartcard_number_one_installation = Installation.new(@attr.merge(:smartcard_number_one => ""))
    no_smartcard_number_one_installation.should_not be_valid
  end    
  
  it "should reject duplicate installation numbers" do
    Installation.create!(@attr)
    installation_with_duplicate_installation_number = Installation.new(@attr)
    installation_with_duplicate_installation_number.should_not be_valid
  end  

end
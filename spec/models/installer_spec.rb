require 'spec_helper'

describe Installer do
  
  before(:each) do 
    @attr = { :installer_number => 'IS33427046', :name => "Test", :surname => "Installer", :contact_number => "0834563434" }
  end
  
  it "should create a new instance given valid attributes" do 
    Installer.create!(@attr)
  end
  
  it "should require a name" do
    no_name_installer = Installer.new(@attr.merge(:name => ""))
    no_name_installer.should_not be_valid
  end
  
  it "should require a surname" do
    no_surname_installer = Installer.new(@attr.merge(:surname => ""))
    no_surname_installer.should_not be_valid
  end
  
  it "should require a contact number" do
    no_contact_number_installer = Installer.new(@attr.merge(:contact_number => ""))
    no_contact_number_installer.should_not be_valid
  end
  
end
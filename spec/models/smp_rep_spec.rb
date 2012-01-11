require 'spec_helper'

describe SmpRep do
  
  before(:each) do 
    @attr = { :smp_rep_code => 'SR333427046', :title => 'Mr', :name => "Test", :surname => "Smp", :contact_number => "0831231212" }
  end
  
  it "should create a new instance given valid attributes" do 
    SmpRep.create!(@attr)
  end
  
  it "should require a name" do
   no_name_smp_rep = SmpRep.new(@attr.merge(:name => ""))
    no_name_smp_rep.should_not be_valid
  end
  
  it "should require a surname" do
   no_surname_smp_rep = SmpRep.new(@attr.merge(:surname => ""))
   no_surname_smp_rep.should_not be_valid
  end
  
  it "should require a email address" do
   no_contact_number_smp_rep = SmpRep.new(@attr.merge(:contact_number => ""))
    no_contact_number_smp_rep.should_not be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_smp_rep = SmpRep.new(@attr.merge(:name => long_name))
    long_name_smp_rep.should_not be_valid
  end
  
  it "should reject surnames that are too long" do
    long_surname = "a" * 51
    long_surname_smp_rep = SmpRep.new(@attr.merge(:surname => long_surname))
    long_surname_smp_rep.should_not be_valid
  end
  
  it "should produce the full name of the smp_rep" do
    smp_rep = SmpRep.new(@attr)
    smp_rep.full_name.should  == 'Mr Test Smp'
  end
  
  it "should reject duplicate SMP Rep numbers" do
    SmpRep.create!(@attr)
    smp_rep_with_duplicate_smp_rep_code = SmpRep.new(@attr)
    smp_rep_with_duplicate_smp_rep_code.should_not be_valid
  end
end
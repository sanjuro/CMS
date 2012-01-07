require 'spec_helper'

describe "installers/new.html.erb" do
  before(:each) do
    assign(:installer, stub_model(Installer,
      :installer_number => "MyString",
      :name => "MyString",
      :surname => "MyString",
      :contact_number => "MyString"
    ).as_new_record)
  end

  it "renders new installer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => installers_path, :method => "post" do
      assert_select "input#installer_installer_number", :name => "installer[installer_number]"
      assert_select "input#installer_name", :name => "installer[name]"
      assert_select "input#installer_surname", :name => "installer[surname]"
      assert_select "input#installer_contact_number", :name => "installer[contact_number]"
    end
  end
end

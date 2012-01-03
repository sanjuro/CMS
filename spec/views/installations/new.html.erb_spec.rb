require 'spec_helper'

describe "installations/new.html.erb" do
  before(:each) do
    assign(:installation, stub_model(Installation,
      :installation_number => "MyString",
      :client_id => "MyInteger",
      :decoder_number_one => "MyString",
      :smartcard_number_one => "MyString",
    ).as_new_record)
  end

  it "renders new installation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => installations_path, :method => "post" do
      assert_select "input#installation_installation_number", :name => "installation[installation_number]"
      assert_select "input#installation_client_id", :name => "installation[client_id]"
      assert_select "input#installation_decoder_number_one", :name => "installation[decoder_number_one]"
      assert_select "input#installation_smartcard_number_one", :name => "installation[smartcard_number_one]"
    end
  end
end

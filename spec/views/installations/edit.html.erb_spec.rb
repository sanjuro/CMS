require 'spec_helper'

describe "installations/edit.html.erb" do
  before(:each) do
    @installtion = assign(:installation, stub_model(Installation,
      :installation_number => "MyString",
      :decoder_number_one => "MyString",
      :smartcard_number_one => "MyString",
    ))
  end

  it "renders the edit installation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => installations_path(@installation), :method => "post" do
      assert_select "input#installation_installation_number", :name => "installation[installation_number]"
      assert_select "input#installation_client_number", :name => "installation[client_number]"
      assert_select "input#installation_decoder_number_one", :name => "installation[decoder_number_one]"
      assert_select "input#installation_smartcard_number_one", :name => "installation[smartcard_number_one]"
    end
  end
end

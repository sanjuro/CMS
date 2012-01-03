require 'spec_helper'

describe "installations/index.html.erb" do
  before(:each) do
    assign(:installations, [
      stub_model(Installtion,
        :installation_number => "Installation Number",
        :decoder_number_one => "Decoder Number",
        :smartcard_number_one => "Smartcard Number",
        :created_at => "Date"
      ),
      stub_model(Installtion,
        :installation_number => "Installation Number",
        :decoder_number_one => "Decoder Number",
        :smartcard_number_one => "Smartcard Number",
        :created_at => "Date"
      )
    ])
  end

  it "renders a list of installations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Installation Number".to_s, :count => 2
    assert_select "tr>td", :text => "Decoder Number".to_s, :count => 2
    assert_select "tr>td", :text => "Smartcard Number".to_s, :count => 2
    assert_select "tr>td", :text => "Date".to_s, :count => 2
  end
end

require 'spec_helper'

describe "installations/index.html.erb" do
  before(:each) do
    page = 1
    per_page = 2
    total_entries = 4
    installations = WillPaginate::Collection.create(page, per_page, total_entries) do |pager|
      pager.replace([stub_model(Installation, :installation_number => "Installation Number",
                                        :decoder_number_one => "Decoder Number",
                                        :installation_type => stub_model(InstallationType, :id => 1, :title => 'PVR'),
                                        :client => Factory(:client),
                                        :smartcard_number_one => "Smartcard Number",
                                        :created_at => "Date"), 
                     stub_model(Installation, :installation_number => "Installation Number",
                                        :decoder_number_one => "Decoder Number",
                                        :installation_type => stub_model(InstallationType, :id => 1, :title => 'PVR'),
                                        :client => Factory(:client),
                                        :smartcard_number_one => "Smartcard Number",
                                        :created_at => "Date"), 
                    stub_model(Installation, :installation_number => "Installation Number",
                                        :decoder_number_one => "Decoder Number",
                                        :installation_type => stub_model(InstallationType, :id => 1, :title => 'PVR'),
                                        :client => Factory(:client),
                                        :smartcard_number_one => "Smartcard Number",
                                        :created_at => "Date"),  
                    stub_model(Installation, :installation_number => "Installation Number",
                                        :decoder_number_one => "Decoder Number",
                                        :installation_type => stub_model(InstallationType, :id => 1, :title => 'PVR'),
                                        :client => Factory(:client),
                                        :smartcard_number_one => "Smartcard Number",
                                        :created_at => "Date")])
    end
    assign(:installations, installations)
  end

  it "renders a list of installations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Installation Number".to_s, :count => 4
    assert_select "tr>td", :text => "PVR".to_s, :count => 4
    assert_select "tr>td", :text => "Mr Test Client".to_s, :count => 4
    assert_select "tr>td", :text => "Decoder Number".to_s, :count => 4
  end
  
  it "should paginate installations" do
    render
    rendered.should have_selector("div.pagination")
    rendered.should have_selector("span.disabled", :content => "Previous")
    rendered.should have_selector("a", :href => "/installations?page=2",
                                       :content => "2")
    rendered.should have_selector("a", :href => "/installations?page=2",
                                       :content => "Next")
  end
end

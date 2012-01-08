require 'spec_helper'

describe "installations/show.html.erb" do
  before(:each) do
    @installation = assign(:installation, stub_model(Installation,
      :installation_number => "MyString",
      :client_number => "MyInteger",
      :decoder_number_one => "MyString",
      :smartcard_number_one => "MyString",
    ))
    
    @client = assign(:client, stub_model(Client,
      :title => "Name",
      :name => "Title",
      :surname => "Surname"
    ))
    
    @comments = @installation.comments.recent.limit(10).all
    
    @installers = @installation.installers.all
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Installation Number/)
    rendered.should match(/Client/)
    rendered.should match(/Decoder Number One/)
    rendered.should match(/Smartcard Number One/)
  end
end

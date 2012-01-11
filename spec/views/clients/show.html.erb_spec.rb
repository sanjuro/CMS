require 'spec_helper'

describe "clients/show.html.erb" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :id => 1,
      :client_number => "C12341234",
      :smp_rep_code => "SR12341234",
      :smp_number => "S12341234",
      :title => "Name",
      :name => "Title",
      :surname => "Surname",
      :email_address => "test@gmail.com",
        
    ))
    
    @comments = @client.comments.recent.limit(10).all
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/C12341234/)
    rendered.should match(/SR12341234/)
    rendered.should match(/S12341234/)
    rendered.should match(/Title/)
    rendered.should match(/Name/)
    rendered.should match(/Surname/)
    rendered.should match(/test@gmail.com/)
  end
end

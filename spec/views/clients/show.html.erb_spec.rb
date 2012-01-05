require 'spec_helper'

describe "clients/show.html.erb" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :title => "Name",
      :name => "Title",
      :surname => "Surname"
    ))
    
    @comments = @client.comments.recent.limit(10).all
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Surname/)
  end
end

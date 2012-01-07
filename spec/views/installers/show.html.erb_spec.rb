require 'spec_helper'

describe "installers/show.html.erb" do
  before(:each) do
    @installer = assign(:installer, stub_model(Installer,
      :installer_number => "Number",
      :name => "Name",
      :surname => "Surname",
      :contact_number => "Contact"
    ))
    
    @comments = @installer.comments.recent.limit(10).all
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    rendered.should match(/Name/)
    rendered.should match(/Surname/)
    rendered.should match(/Contact/)
  end
end

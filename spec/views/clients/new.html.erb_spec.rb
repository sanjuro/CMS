require 'spec_helper'

describe "clients/new.html.erb" do
  before(:each) do
    assign(:client, stub_model(Client,
      :name => "MyString",
      :title => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new clien form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clients_path, :method => "post" do
      assert_select "input#client_name", :name => "client[name]"
      assert_select "input#client_title", :name => "client[title]"
      assert_select "textarea#client_content", :name => "client[content]"
    end
  end
end

require 'spec_helper'

describe "clients/new.html.erb" do
  before(:each) do
    assign(:client, stub_model(Client,
      :title => "MyString",
      :name => "MyString",
      :surname => "MyString"
    ).as_new_record)
  end

  it "renders new client form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clients_path, :method => "post" do
      assert_select "input#client_title", :name => "client[title]"
      assert_select "input#client_name", :name => "client[name]"
      assert_select "input#client_surname", :name => "client[surname]"
    end
  end
end

require 'spec_helper'

describe "clients/index.html.erb" do
  before(:each) do
    page = 1
    per_page = 2
    total_entries = 4
    clients = WillPaginate::Collection.create(page, per_page, total_entries) do |pager|
      pager.replace([stub_model(Client, :title => "Mr",
                                        :name => "Title",
                                        :surname => "Surname"), 
                     stub_model(Client, :title => "Mrs",
                                        :name => "Title",
                                        :surname => "Surname"), 
                     stub_model(Client, :title => "Ms",
                                        :name => "Title",
                                        :surname => "Surname"),  
                     stub_model(Client, :title => "Sr",
                                        :name => "Title",
                                        :surname => "Surname")])
    end
    assign(:clients, clients)
  end


  it "renders a list of clients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should have_selector("div.feed")

    assert_select ".feed", :count => 4
    assert_select ".feed_full_name",  :count => 4
    assert_select ".feed_client_number",  :count => 4
    assert_select ".feed_full_address",  :count => 4
    assert_select ".feed_buttons", :count => 4
  end
  
  it "should paginate clients" do
    render
    rendered.should have_selector("div.page")
    rendered.should have_selector("div.loader")
  end

end

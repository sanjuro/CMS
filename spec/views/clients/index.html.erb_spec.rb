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
    assert_select "tr>td", :text => "Mr".to_s, :count => 1
    assert_select "tr>td", :text => "Title".to_s, :count => 4
    assert_select "tr>td", :text => "Surname".to_s, :count => 4
  end
  
  it "should paginate clients" do
    render
    rendered.should have_selector("div.pagination")
    rendered.should have_selector("span.disabled", :content => "Previous")
    rendered.should have_selector("a", :href => "/clients?page=2",
                                       :content => "2")
    rendered.should have_selector("a", :href => "/clients?page=2",
                                       :content => "Next")
  end

end

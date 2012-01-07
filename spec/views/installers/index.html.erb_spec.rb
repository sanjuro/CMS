require 'spec_helper'

describe "installers/index.html.erb" do
  before(:each) do
    page = 1
    per_page = 2
    total_entries = 4
    installers = WillPaginate::Collection.create(page, per_page, total_entries) do |pager|
      pager.replace([stub_model(Installer, :installer_number => "IS12341231",
                                        :name => "Title",
                                        :surname => "Surname"), 
                     stub_model(Installer, :installer_number => "IS12341232",
                                        :name => "Title",
                                        :surname => "Surname"), 
                     stub_model(Installer, :installer_number => "IS12341233",
                                        :name => "Title",
                                        :surname => "Surname"),  
                     stub_model(Installer, :installer_number => "IS12341234",
                                        :name => "Title",
                                        :surname => "Surname")])
    end
    assign(:installers, installers)
  end


  it "renders a list of installers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "IS12341234".to_s, :count => 1
    assert_select "tr>td", :text => "Title".to_s, :count => 4
    assert_select "tr>td", :text => "Surname".to_s, :count => 4
  end
  
  it "should paginate installers" do
    render
    rendered.should have_selector("div.pagination")
    rendered.should have_selector("span.disabled", :content => "Previous")
    rendered.should have_selector("a", :href => "/installers?page=2",
                                       :content => "2")
    rendered.should have_selector("a", :href => "/installers?page=2",
                                       :content => "Next")
  end

end

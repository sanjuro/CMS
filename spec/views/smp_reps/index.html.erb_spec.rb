require 'spec_helper'

describe "smp_reps/index.html.erb" do
  before(:each) do
    page = 1
    per_page = 2
    total_entries = 4
    smp_reps = WillPaginate::Collection.create(page, per_page, total_entries) do |pager|
      pager.replace([stub_model(SmpRep, :smp_rep_code => "SR12341234",
                                        :title => "Mr",
                                        :name => "Name",
                                        :surname => "Surname"), 
                     stub_model(SmpRep, :smp_rep_code => "SR12341236",
                                        :title => "Mr",
                                        :name => "Name",
                                        :surname => "Surname"), 
                     stub_model(SmpRep, :smp_rep_code => "SR12341237",
                                        :title => "Mr",
                                        :name => "Name",
                                        :surname => "Surname"),  
                     stub_model(SmpRep, :smp_rep_code => "SR12341238",
                                        :title => "Mr",
                                        :name => "Name",
                                        :surname => "Surname")])
    end
    assign(:smp_reps, smp_reps)
  end


  it "renders a list of smp_reps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "SR12341234".to_s, :count => 1
    assert_select "tr>td", :text => "Mr".to_s, :count => 4
    assert_select "tr>td", :text => "Name".to_s, :count => 4
    assert_select "tr>td", :text => "Surname".to_s, :count => 4
  end
  
  it "should paginate smp_reps" do
    render
    rendered.should have_selector("div.pagination")
    rendered.should have_selector("span.disabled", :content => "Previous")
    rendered.should have_selector("a", :href => "/smp_reps?page=2",
                                       :content => "2")
    rendered.should have_selector("a", :href => "/smp_reps?page=2",
                                       :content => "Next")
  end

end

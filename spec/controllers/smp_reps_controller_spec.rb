require 'spec_helper' 

describe SmpRepsController do
  render_views
  login_user
  
  it "should have a current_user" do
    subject.current_user.should_not be_nil
  end
  
  describe "GET 'index'" do
  
    it "should be successful" do 
      get :index
      response.should be_success 
    end
    
    it "should have the right title" do 
      get :index
      response.should have_selector("title", :content => "CMS | SMP Reps") 
    end
    
  end 
  
  describe "GET 'new'" do
    
    it "should be successful" do 
      get :new
      response.should be_success 
    end
    
    it "should have the right title" do 
      get :new
      response.should have_selector("title", :content => "CMS | New SMP Rep") 
    end
    
  end
  
  describe "POST 'create'" do
    
    describe "success" do
      
      before(:each) do 
        @attr = { :smp_rep_code => "SR12341234", :title => 'Mr', :name => "Test", :surname => "Smprep", :contact_number => '0831231212' }
      end
      
      it "should create a smp rep" do
        lambda do
          post :create, :smp_rep => @attr
        end.should change(SmpRep, :count).by(1)
      end
      
      it "should redirect to the smp rep show page" do 
        post :create, :smp_rep => @attr 
        response.should redirect_to(smp_rep_path(assigns(:smp_rep)))
      end
      
    end 
    
    describe "failure" do
      
      before(:each) do
        @attr = { :smp_rep_code => '', :title => '', :name => '', :surname => '', :contact_number => '' }
      end
      
      it "should not create a smp rep" do
        lambda do
          post :create, :smp_rep => @attr
        end.should_not change(SmpRep, :count)
      end
      
      it "should have the right title" do 
        get :new
        response.should have_selector("title", :content => "CMS | New SMP Rep") 
      end
      
      it "should render the 'new' page" do
        post :create, :smp_rep => @attr
        response.should render_template('new')
      end
      
    end   
    
  end
  
  describe "GET 'show'" do
    
    before(:each) do
      @smp_rep = Factory(:smp_rep)
    end
    
    it "should be successful" do
      get :show, :id => @smp_rep
      response.should be_success
    end
    
    it "should find the right smp rep" do
      get :show, :id => @smp_rep
      assigns(:smp_rep).should == @smp_rep
    end

  end
  
end
require 'spec_helper' 

describe InstallationsController do
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
      response.should have_selector("title", :content => "CMS | Installations") 
    end
    
  end  
  
  describe "GET 'new'" do
    
    it "should be successful" do 
      get :new
      response.should be_success 
    end
    
    it "should have the right title" do 
      get :new
      response.should have_selector("title", :content => "CMS | New Installation") 
    end
    
  end
  
  describe "POST 'create'" do
    
    describe "success" do
      
      before(:each) do 
        @attr = { :installation_number => "I13123123", :client_id => 1, :decoder_number_one => "D1231232123", :smartcard_number_one => "S13123123" }
      end
      
      it "should create a installation" do
        lambda do
          post :create, :installation => @attr
        end.should change(Installation, :count).by(1)
      end
      
      it "should redirect to the installation show page" do 
        post :create, :installation => @attr 
        response.should redirect_to(installation_path(assigns(:installation)))
      end
      
    end 
    
    describe "failure" do
      
      before(:each) do
        @attr = { :installation_number => "", :client_id => "", :decoder_number_one => "", :smartcard_number_one => "" }
      end
      
      it "should not create a installation" do
        lambda do
          post :create, :installation => @attr
        end.should_not change(Installation, :count)
      end
      
      it "should have the right title" do 
        get :new
        response.should have_selector("title", :content => "CMS | New Installation") 
      end
      
      it "should render the 'new' page" do
        post :create, :installation => @attr
        response.should render_template('new')
      end
      
    end   
    
  end
  
  describe "GET 'show'" do
    
    before(:each) do
      @installation = Factory(:installation)
    end
    
    it "should be successful" do
      get :show, :id => @installation
      response.should be_success
    end
    
    it "should find the right installation" do
      get :show, :id => @installation
      assigns(:installation).should == @installation
    end

  end
    
end
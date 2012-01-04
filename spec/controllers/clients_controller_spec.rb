require 'spec_helper' 

describe ClientsController do
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
      response.should have_selector("title", :content => "CMS | Clients") 
    end
    
  end  
  
  describe "GET 'new'" do
    
    it "should be successful" do 
      get :new
      response.should be_success 
    end
    
    it "should have the right title" do 
      get :new
      response.should have_selector("title", :content => "CMS | New Client") 
    end
    
  end
  
  describe "POST 'create'" do
    
    describe "success" do
      
      before(:each) do 
        @attr = { :client_number => "C13123123", :title => "Mr", :name => "Test", :surname => "Client", :email_address => "test@gmail.com" }
      end
      
      it "should create a client" do
        lambda do
          post :create, :client => @attr
        end.should change(Client, :count).by(1)
      end
      
      it "should redirect to the client show page" do 
        post :create, :client => @attr 
        response.should redirect_to(client_path(assigns(:client)))
      end
      
    end
    
    describe "failure" do
      
      before(:each) do
        @attr = { :client_number => "", :title => "", :name => "", :surname => "", :email_address => "" }
      end
      
      it "should not create a client" do
        lambda do
          post :create, :client => @attr
        end.should_not change(Client, :count)
      end
      
      it "should have the right title" do 
        get :new
        response.should have_selector("title", :content => "CMS | New Client") 
      end
      
      it "should render the 'new' page" do
        post :create, :client => @attr
        response.should render_template('new')
      end
      
    end
    
  end
  
  describe "GET 'show'" do
    
    before(:each) do
      @client = Factory(:client)
    end
    
    it "should be successful" do
      get :show, :id => @client
      response.should be_success
    end
    
    it "should find the right client" do
      get :show, :id => @client
      assigns(:client).should == @client
    end

  end
  
end
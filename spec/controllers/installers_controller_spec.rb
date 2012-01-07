require 'spec_helper' 

describe InstallersController do
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
      response.should have_selector("title", :content => "CMS | Installers") 
    end
    
  end  
  
  describe "GET 'new'" do
    
    it "should be successful" do 
      get :new
      response.should be_success 
    end
    
    it "should have the right title" do 
      get :new
      response.should have_selector("title", :content => "CMS | New Installer") 
    end
    
  end
  
  describe "POST 'create'" do
    
    describe "success" do
      
      before(:each) do 
        @attr = { :installer_number => "IS3123123", :name => "Test", :surname => "Installer", :contact_number => "0843453434" }
      end
      
      it "should create a installer" do
        lambda do
          post :create, :installer => @attr
        end.should change(Installer, :count).by(1)
      end
      
      it "should redirect to the installer show page" do 
        post :create, :installer => @attr 
        response.should redirect_to(installer_path(assigns(:installer)))
      end
      
    end
    
    describe "failure" do
      
      before(:each) do
        @attr = { :installer_number => "", :name => "", :surname => "", :contact_number => "" }
      end
      
      it "should not create a installer" do
        lambda do
          post :create, :installer => @attr
        end.should_not change(Installer, :count)
      end
      
      it "should have the right title" do 
        get :new
        response.should have_selector("title", :content => "CMS | New Installer") 
      end
      
      it "should render the 'new' page" do
        post :create, :installer => @attr
        response.should render_template('new')
      end
      
    end
    
  end
  
  describe "GET 'show'" do
    
    before(:each) do
      @installer = Factory(:installer)
    end
    
    it "should be successful" do
      get :show, :id => @installer
      response.should be_success
    end
    
    it "should find the right client" do
      get :show, :id => @installer
      assigns(:installer).should == @installer
    end

  end
  
end
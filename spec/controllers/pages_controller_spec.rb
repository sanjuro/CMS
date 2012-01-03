require 'spec_helper' 

describe PagesController do
  
  describe "GET 'home'" do 
    
    it "should be successful" do
      get 'home'
      response.should be_success 
    end
    
  end
  
  describe "GET 'news'" do 
    
    it "should be successful" do
      get 'news'
      response.should be_success 
    end
    
  end
  
end
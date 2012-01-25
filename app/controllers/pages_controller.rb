class PagesController < ApplicationController
  before_filter :authenticate_user!
  
  def home
    @controller = "clients"
    @title = "Home"
    
    @client_count = Client.count
    @installation_count = Installation.count

  end
  
  def news
    @controller = "clients"
    @title = "News"
  end

end

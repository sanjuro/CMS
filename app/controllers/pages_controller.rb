class PagesController < ApplicationController
  
  def home
    @controller = "clients"
    @title = "Home"
  end
  
  def news
    @controller = "clients"
    @title = "News"
  end

end

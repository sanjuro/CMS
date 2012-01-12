class PagesController < ApplicationController
  before_filter :authenticate_user!
  
  def home
    @controller = "clients"
    @title = "Home"

  end
  
  def news
    @controller = "clients"
    @title = "News"
  end

end

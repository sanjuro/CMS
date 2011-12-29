class PagesController < ApplicationController
  
  def home
    @title = "Home"
  end
  
  def news
    @title = "News"
  end

end

class PagesController < ApplicationController
  before_filter :authenticate_user!
  
  def home
    @controller = "clients"
    @title = "Home"
    
    @client_count = Client.count
    @installation_count = Installation.count
    @smp_client_count = Client.find_smp_clients.count

    @months = ["2012-01-01 00:00:00", 
               "2012-02-01 00:00:00", 
               "2012-03-01 00:00:00",
               "2012-04-01 00:00:00",
               "2012-05-01 00:00:00",
               "2012-06-01 00:00:00",
               "2012-07-01 00:00:00",
               "2012-08-01 00:00:00",
               "2012-09-01 00:00:00",
               "2012-10-01 00:00:00",
               "2012-11-01 00:00:00",
               "2012-12-01 00:00:00"]

      @installations_volume_by_month = ''

      (@months).map do |month| 
        @installations_volume_by_month << Installation.installations_by_month(Date.parse(month)).inspect + ","
      end
      p @installations_volume_by_month.tr('"', '')
  end
  
  def news
    @controller = "clients"
    @title = "News"
  end

end

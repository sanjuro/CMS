class ClientsController < ApplicationController
  
  def index
    @clients = Client.all
   
    respond_to do |format|
      format.html { render :layout => true } # index.html.erb
      format.xml  { render :xml => @clients }
      format.json  { render :json => @clients }
    end
  end
  
  def new
    @client = Client.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @client }
      format.json  { render :json => @client }
    end
  end
  
  def show
    @client = Client.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @client }
      format.json  { render :json => @client }
    end
  end
 
  def destroy
    @client = Client.find(params[:id])
    @client.destroy
   
    respond_to do |format|
      format.html { redirect_to(clients_url) }
      format.xml  { head :ok }
    end
  end  
  
end

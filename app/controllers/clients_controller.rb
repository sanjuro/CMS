class ClientsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @title = "Clients"
    @controller = "clients"
    @clients = Client.search(params[:search],params[:fieldtype]).order('created_at DESC')
   
    respond_to do |format|
      format.html { render :layout => true } # index.html.erb
      format.xml  { render :xml => @clients }
      format.json  { render :json => @clients }
    end
  end
  
  def new
    @title = "New Client"
    @controller = "clients"
    @client = Client.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @client }
      format.json  { render :json => @client }
    end
  end
  
  def create
    @controller = "clients"
    @client = Client.new(params[:client])
   
    respond_to do |format|
      if @client.save
        format.html  { redirect_to(@client,
                      :success => 'Client was successfully created.') }
        format.json  { render :json => @client,
                      :status => :created, :location => @client }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @client.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @controller = "clients"
    @client = Client.find(params[:id])
    @title = "Showing " + @client.name + ' ' + @client.surname
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @client }
      format.json  { render :json => @client }
    end
  end
  
  def edit
    @controller = "clients"
    @client = Client.find(params[:id])
    @title = "Editing " + @client.name + ' ' + @client.surname
  end
  
  def update
    @controller = "clients"
    @client = Client.find(params[:id])
    @title = "Editing " + @client.name + ' ' + @client.surname
   
    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html  { redirect_to(@client,
                      :notice => 'Client was successfully updated.') }
        format.json  { render :json => {}, :status => :ok }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @client.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @controller = "clients"
    @client = Client.find(params[:id])
    @client.destroy
   
    respond_to do |format|
      format.html { redirect_to(clients_url) }
      format.xml  { head :ok }
    end
  end  
  
end

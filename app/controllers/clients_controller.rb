class ClientsController < ApplicationController
  
  before_filter :authenticate_user!
  
  add_breadcrumb "home", :root_path
  
  def index
    @title = "Clients"
    @controller = "clients"

    # handle pagination search
    if params[:page].nil?
      search = Client.solr_search do
        fulltext params[:search]
        paginate :per_page => 25
      end
      @clients = search.results
    else
      @clients = Client.search(params[:search],params[:fieldtype]).order('created_at DESC').page(params[:page]).per(25)
    end

    add_breadcrumb "clients", clients_path, :title => "Back to the Index"
      
    respond_to do |format|
      format.html { render :layout => true } # index.html.erb
      format.xml  { render :xml => @clients }
      format.json  { render :json => @clients }
      format.js
    end
  end
  
  def new
    @title = "New Client"
    @controller = "clients"
    @client = Client.new
    @client.user = current_user
   
    add_breadcrumb "clients", clients_path, :title => "Back to the Index"
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @client }
      format.json  { render :json => @client }
    end
  end
  
  def create
    @controller = "clients"
    @client = Client.new(params[:client])
    @client.user = current_user
    
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
    @title = "Showing " + @client.full_name
    
    @installations = @client.installations
    @comments = @client.comments.recent.limit(10).all
    
    add_breadcrumb "clients", clients_path, :title => "Back to the Index"
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @client }
      format.json  { render :json => @client }
    end
  end
  
  def edit
    @controller = "clients"
    @client = Client.find(params[:id])
    @title = "Editing " + @client.full_name
    
    add_breadcrumb "clients", clients_path, :title => "Back to the Index"
  end
  
  def update
    @controller = "clients"
    @client = Client.find(params[:id])
    @title = "Editing " + @client.full_name
   
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
    p 'poes'
    @client = Client.find(params[:id])
    @client.destroy
   
    respond_to do |format|
      format.html { redirect_to(clients_url) }
      format.xml  { head :ok }
    end
  end  
  
end

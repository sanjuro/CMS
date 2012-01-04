class InstallationsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @controller = "installations"
    @title = "Installations"
    @installations = Installation.search(params[:search],params[:fieldtype]).order('created_at DESC').paginate(:per_page => 2, :page => params[:page])
   
    respond_to do |format|
      format.html { render :layout => true } # index.html.erb
      format.xml  { render :xml => @installations }
      format.json  { render :json => @installations }
    end
  end
  
  def new
    @controller = "installations"
    @title = "New Installation"
    @installation = Installation.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @client }
      format.json  { render :json => @client }
    end
  end
  
  def create
    @installation = Installation.new(params[:installation])
   
    respond_to do |format|
      if @installation.save
        format.html  { redirect_to(@installation,
                      :notice => 'Installation was successfully created.') }
        format.json  { render :json => @installation,
                      :status => :created, :location => @installation }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @installation.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @controller = "installations"
    @installation = Installation.find(params[:id])
    @title = "Showing " + @installation.installation_number
    
    @comments = @installation.comments.recent.limit(10).all
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @installation }
      format.json  { render :json => @installation }
    end
  end
  
  def edit
    @controller = "installations"
    @installation = Installation.find(params[:id])
    @title = "Editing " + @installation.installation_number
  end
  
  def update
    @controller = "installations"
    @installation = Installation.find(params[:id])
    @title = "Editing " + @installation.installation_number
   
    respond_to do |format|
      if @installation.update_attributes(params[:installation])
        format.html  { redirect_to(@installation,
                      :notice => 'Installation was successfully updated.') }
        format.json  { render :json => {}, :status => :ok }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @installation.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
  
end
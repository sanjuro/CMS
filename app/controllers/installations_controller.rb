class InstallationsController < ApplicationController
  
  before_filter :authenticate_user!
  
  add_breadcrumb "home", :root_path
  
  def index
    @controller = "installations"
    @title = "Installations"
    @installations = Installation.search(params[:search],params[:fieldtype]).order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
   
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
    
    if params[:client_number]
      @installation.client_number = params[:client_number] 
    end
    
    @installation.generate_installation_number
    
    
    @installation_types = InstallationType.find(:all) 
    @lnb_types = LnbType.find(:all) 
    @installers = Installer.find(:all) 
    
    add_breadcrumb "installations", installations_path, :title => "Back to the Index"
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @installation }
      format.json  { render :json => @installation }
    end
  end
  
  def create
    @installation = Installation.new(params[:installation])
    @installation_types = InstallationType.find(:all) 
    @lnb_types = LnbType.find(:all) 
    @installers = Installer.find(:all) 
   
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
    
    @installers = @installation.installers
    
    add_breadcrumb "installations", installations_path, :title => "Back to the Index"
    
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
    
    add_breadcrumb "installations", installations_path, :title => "Back to the Index"
  end
  
  def update
    @controller = "installations"
    @installation = Installation.find(params[:id])
    @title = "Editing " + @installation.installation_number
    
    params[:installation][:installer_ids] ||= []
   
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
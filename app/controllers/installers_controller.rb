class InstallersController < ApplicationController
  
  before_filter :authenticate_user!
  
  add_breadcrumb "home", :root_path
  
  def index
    @title = "Installers"
    @controller = "installers"
    @installers = Installer.search(params[:search],params[:fieldtype]).order('created_at DESC').paginate(:per_page => 15, :page => params[:page])
   
    add_breadcrumb "installers", installers_path, :title => "Back to the Index"
      
    respond_to do |format|
      format.html { render :layout => true } # index.html.erb
      format.xml  { render :xml => @installers }
      format.json  { render :json => @installers }
    end
  end
  
  def new
    @title = "New Installer"
    @controller = "installers"
    @installer = Installer.new
   
    add_breadcrumb "installers", installers_path, :title => "Back to the Index"
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @installer }
      format.json  { render :json => @installer }
    end
  end
  
  def create
    @controller = "installers"
    @installer = Installer.new(params[:installer])
   
    respond_to do |format|
      if @installer.save
        format.html  { redirect_to(@installer,
                      :success => 'Installer was successfully created.') }
        format.json  { render :json => @installer,
                      :status => :created, :location => @installer }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @installer.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @controller = "installations"
    @installer = Installer.find(params[:id])
    @title = "Showing " + @installer.full_name
    
    @comments = @installer.comments.recent.limit(10).all
    
    add_breadcrumb "installers", installers_path, :title => "Back to the Index"
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @installer }
      format.json  { render :json => @installer }
    end
  end
  
  def edit
    @controller = "installers"
    @installer = Installer.find(params[:id])
    @title = "Editing " + @installer.full_name
    
    add_breadcrumb "installers", installers_path, :title => "Back to the Index"
  end
  
  def update
    @controller = "installers"
    @installer = Installer.find(params[:id])
    @title = "Editing " + @installer.full_name
   
    respond_to do |format|
      if @installer.update_attributes(params[:client])
        format.html  { redirect_to(@installer,
                      :notice => 'Installer was successfully updated.') }
        format.json  { render :json => {}, :status => :ok }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @installer.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @controller = "installers"
    @installer = Installer.find(params[:id])
    @installer.destroy
   
    respond_to do |format|
      format.html { redirect_to(installers_url) }
      format.xml  { head :ok }
    end
  end  
  
end

class SmpRepsController < ApplicationController

  before_filter :authenticate_user!
  
  add_breadcrumb "home", :root_path
  
  def index
    @controller = "smp_reps"
    @title = "SMP Reps"
    @smp_reps = SmpRep.search(params[:search],params[:fieldtype]).order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
   
    respond_to do |format|
      format.html { render :layout => true } # index.html.erb
      format.xml  { render :xml => @smp_reps }
      format.json  { render :json => @smp_reps }
    end
  end  
  
  def new
    @controller = "smp_reps"
    @title = "New SMP Rep"
    @smp_rep = SmpRep.new
    
    @smp_rep.generate_smp_rep_code
    
    add_breadcrumb "smp_reps", smp_reps_path, :title => "Back to the Index"
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @smp_rep }
      format.json  { render :json => @smp_rep }
    end
  end
  
  def create
    @controller = "smp_reps"
    @smp_rep = SmpRep.new(params[:smp_rep])
   
    respond_to do |format|
      if @smp_rep.save
        format.html  { redirect_to(@smp_rep,
                      :success => 'SMP Rep was successfully created.') }
        format.json  { render :json => @smp_rep,
                      :status => :created, :location => @smp_rep }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @smp_rep.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @controller = "smp_reps"
    @smp_rep = SmpRep.find(params[:id])
    @title = "Showing " + @smp_rep.fullname
    
    @comments = @smp_rep.comments.recent.limit(10).all
    
    add_breadcrumb "smp_reps", smp_reps_path, :title => "Back to the Index"
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @smp_rep }
      format.json  { render :json => @smp_rep }
    end
  end
  
  def edit
    @controller = "smp_reps"
    @smp_rep = SmpRep.find(params[:id])
    @title = "Editing " + @smp_rep.full_name
    
    add_breadcrumb "smp_reps", smp_reps_path, :title => "Back to the Index"
  end
  
end
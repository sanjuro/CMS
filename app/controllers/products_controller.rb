class ProductsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @controller = "products"
    @title = "Products"
    @products = Product.search(params[:search],params[:fieldtype]).order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
   
    respond_to do |format|
      format.html { render :layout => true } # index.html.erb
      format.xml  { render :xml => @products }
      format.json  { render :json => @products }
    end
  end  

  def new
    @controller = "products"
    @title = "Products"
    @product = Product.new
    
    
    add_breadcrumb "Products", products_path, :title => "Back to the Index"
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
      format.json  { render :json => @product }
    end
  end

  def create
    @controller = "products"
    @product = Product.new(params[:product])
   
    respond_to do |format|
      if @product.save
        format.html  { redirect_to(@product,
                      :success => 'Product was successfully created.') }
        format.json  { render :json => @product,
                      :status => :created, :location => @product }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @product.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def show
    @controller = "products"
    @product = Product.find(params[:id])
    @title = "Showing " + @product.product_name
    
    @comments = @product.comments.recent.limit(10).all
    
    add_breadcrumb "Products", products_path, :title => "Back to the Index"
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
      format.json  { render :json => @product }
    end
  end

 def edit
    @controller = "products"
    @product = Product.find(params[:id])
    @title = "Editing " + @product.product_name
    
    add_breadcrumb "Prducts", products_path, :title => "Back to the Index"
  end
  
  def update
    @controller = "products"
    @product = Product.find(params[:id])
    @title = "Editing " + @product.product_name
   
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html  { redirect_to(@product,
                      :notice => 'Product was successfully updated.') }
        format.json  { render :json => {}, :status => :ok }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @product.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @controller = "products"
    @product = Product.find(params[:id])
    @product.destroy
   
    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end  
end
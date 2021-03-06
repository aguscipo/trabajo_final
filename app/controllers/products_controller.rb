class ProductsController < ApplicationController
	before_action :admin_user, except: [:show, :search]

  def new
    @product = Product.new
  end

  def show
    @product = Product.find_by name: params[:name]
  end

  def edit
		@product = Product.find_by name: params[:name]
  end

  def update
		@product = Product.find_by name: params[:name]
    if @product.update_attributes(product_params)
      flash[:success] = t(:product_update)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def create
    @product = Product.new(product_params)
  	if @product.save
		flash[:success] = t(:product_create)
			redirect_to root_url
  	else
	    	render 'new'
  	end
  end

	def destroy
	  (Product.find_by name: params[:name]).destroy
	  flash[:success] = t(:product_delete)
	  redirect_to request.referrer || root_url
	end

	def search
		search = Product.search do
		  fulltext params[:search]
			order_by :price, :asc
    end
		@products = search.results
		flash.now[:info] = t(:product_search) if !@products.any?
	end

	private
		def product_params
    		params.require(:product).permit(:name, :picture, :description, :category_id, :price, :stock, :trademark_id, :code, :offer, :cover_picture)
    end

	#	A list of the param names that can be used for filtering the Product list
		def filtering_params(params)
		 params.slice(:name, :category_id, :trademark)
		end

end

class ProductsController < ApplicationController
	before_action :admin_user, except: [:show, :search, :search_by_category]

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
      @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "Producto actualizado"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def create
    @product = Product.new(product_params)
  	if @product.save
		flash[:success] = "Producto creado!"
			redirect_to root_url
  	else
	    	render 'new'
  	end
  end

	def destroy
        Product.find(params[:id]).destroy
        flash[:success] = "El producto ha sido eliminado"
        redirect_to request.referrer || root_url
	end

	def search
		products = Product.search do
		  fulltext params[:search]
    end
		@results = products.results
		flash.now[:info] = "Ningún nombre de prodcuto coincide con su búsqueda" if !@results.any?
	end
=begin
	def search_by_category
		products= Product.search do
  		with(:category_id, params[:category_id])
		end
		@results = products.results
	end
=end
	private
		def product_params
    		params.require(:product).permit(:name, :picture, :description, :category_id, :price, :stock, :trademark, :code, :offer, :cover_picture)
    end

	#	A list of the param names that can be used for filtering the Product list
		def filtering_params(params)
		 params.slice(:name, :category_id, :trademark)
		end

end

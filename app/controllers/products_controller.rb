class ProductsController < ApplicationController
	before_action :admin_user, except: [:show]

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

	private
		def product_params
    		params.require(:product).permit(:name, :picture, :description, :category, :price, :stock, :trademark, :code, :offer, :cover_picture)
    end

	#	A list of the param names that can be used for filtering the Product list
		def filtering_params(params)
		 params.slice(:name, :category, :trademark)
		end

end

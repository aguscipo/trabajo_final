class ProductsController < ApplicationController
	before_action :admin_user, except: [:show, :search, :filter_by_trademark, :payment]

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
		search = Product.search do
		  fulltext params[:search]
			order_by :price, :asc
    end
		@products = search.results
		flash.now[:info] = "Ningún nombre de prodcuto coincide con su búsqueda" if !@products.any?
	end

	def payment

		$mp = MercadoPago.new('TEST-5640660696498136-080316-544feb8227681243019101f924b99726__LD_LC__-12055441')
		$mp.sandbox_mode(true)
		paymentData = Hash[
				"transaction_amount" => 100,
				"token" => params[:token],
				"description" => "Title of what you are paying for",
				"installments" => 1,
				"payment_method_id" => "visa",
				"payer" => Hash[
					"email" => "test_user_123456@testuser.com"
				]
			]

		payment = $mp.post("/v1/payments", paymentData);
		@payment=payment
		@paymentData=paymentData
		render 'payment'
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

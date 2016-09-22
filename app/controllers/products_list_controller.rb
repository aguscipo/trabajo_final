class ProductsListController < ApplicationController
  def filter
    productList= ProductList.new
		@trademark= Trademark.find_by name:(params[:trademark])
		@category= Category.find_by name:(params[:category])
		@products = productList.filter_by(@category, @trademark)
		render 'products_list'
	end

  def order
    productList= ProductList.new
    @trademark= Trademark.find_by name:(params[:trademark]) unless params[:trademark].nil?
    @category= Category.find_by name:(params[:category])
    option= params[:order_by]
    @products = productList.order_by(option, @category, @trademark)
    @trademarks = Set.new
    @products.each do |product|
      @trademarks.add(product.trademark)
    end
    @default=params[:order_by]
    render 'products_list'
  end

end

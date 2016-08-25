class ProductsListController < ApplicationController
  def filter
		trademark= Trademark.find_by name:(params[:trademark])
		category= Category.find_by name:(params[:category])
		search= Product.search do
		 all_of do
			 with(:category_id, category.id)
			 with(:trademark_id, trademark.id)
		 end
		end
		@products = search.results
		@trademark = trademark
		@category= category
		render 'filter'
	end

  def order
    trademark= Trademark.find_by name:(params[:trademark]) unless params[:trademark].nil?
    category= Category.find_by name:(params[:category])
    search= Product.search do
       all_of do
         with(:category_id, category.id)
         with(:trademark_id, trademark.id) unless trademark.nil?
       end
       if params[:order_by] == 'Menor precio'
         order_by :price, :asc
       elsif params[:order_by] =='Mayor precio'
         order_by :price, :desc
      end
    end
    @products = search.results
    @trademark = trademark unless trademark.nil?
    @category= category
    @trademarks = Set.new
    @products.each do |product|
      @trademarks.add(product.trademark)
    end
    @default=params[:order_by]
    render 'filter'
  end

end

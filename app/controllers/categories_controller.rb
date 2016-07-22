class CategoriesController < ApplicationController
  before_action :admin_user, except: [:show]

  def index
    @categories = Category.paginate(page: params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
  	if @category.save
		flash[:success] = "Categoria añadida!"
			redirect_to new_product_path
  	else
	    	render 'new'
  	end
  end

  def show
    category = Category.find_by name:(params[:name])
    search = Product.search do
      with(:category_id, category.id)
      order_by :price, :asc
    end
    @products=search.results
    @category = category
    @trademarks = Set.new
    @products.each do |product|
      @trademarks.add(product.trademark)
    end
  end

  def edit
    @category = Category.find_by name:(params[:name])
  end

  def update
    @category = Category.find_by name:(params[:name])
    if @category.update_attributes(category_params)
      flash[:success] = "Categoria actualizada"
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    (Category.find_by name:(params[:name])).destroy
    flash[:success] = "La categoria ha sido eliminada"
    redirect_to request.referrer || root_url
  end

  private
    def category_params
        params.require(:category).permit(:name)
    end
end

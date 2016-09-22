class CategoriesController < ApplicationController
  before_action :admin_user, except: [:show]

  def index
    @categories = Category.paginate(page: params[:page],:per_page => 10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
  end

  def show
    category = Category.find_by name:(params[:name])
    @products= category.get_products
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
    @category= Category.find_by name:(params[:name])
    @category.update_attributes(category_params)
  end

  def delete
    @category = Category.find_by name:(params[:category_name])
  end

  def destroy
    @categories = Category.all
    @category= Category.find_by name:(params[:name])
    @category.destroy
  end

  private
    def category_params
        params.require(:category).permit(:name)
    end
end

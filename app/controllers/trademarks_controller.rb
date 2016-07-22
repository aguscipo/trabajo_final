class TrademarksController < ApplicationController
  before_action :admin_user, except: [:show,:search]

  def index
    @trademarks = Trademark.paginate(page: params[:page])
  end

  def new
    @trademark = Trademark.new
  end

  def create
    @trademark = Trademark.new(trademark_params)
  	if @trademark.save
		flash[:success] = "Marca añadida!"
			redirect_to new_product_path
  	else
	    	render 'new'
  	end
  end

  def edit
    @trademark = Trademark.find_by name:(params[:name])
  end

  def update
    @trademark = Trademark.find_by name:(params[:name])
    if @trademark.update_attributes(trademark_params)
      flash[:success] = "Marca actualizada"
      redirect_to trademarks_path
    else
      render 'edit'
    end
  end

  def destroy
    (Trademark.find_by name:(params[:name])).destroy
    flash[:success] = "La marca ha sido eliminada"
    redirect_to request.referrer || root_url
  end

  def search
    trademark= Trademark.find_by name:(params[:trademark])
    category= Category.find_by name:(params[:category])
    search= Product.search do
     all_of do
       with(:category_id, category.id)
       with(:trademark_id, trademark.id)
     end
    end
    @products = search.results
    render 'search'
  end

  private
    def trademark_params
        params.require(:trademark).permit(:name)
    end
end

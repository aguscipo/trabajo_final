class StaticPagesController < ApplicationController
 def home
 	@products = Product.paginate(page: params[:page], :per_page => 30)
 	 #@offers = Product.first(3)
	 #@product = Product.new if logged_in? && current_user.admin?
  end
  def help
  end
  
  def about
  end

  def contact
  end

end

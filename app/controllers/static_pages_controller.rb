class StaticPagesController < ApplicationController
 def home
 	@products = Product.paginate(page: params[:page], :per_page => 10)
 	p= Product.where.not(offer:false,cover_picture:nil)
 	@offers = p.first(5)
 end

  def help
  end

  def about
  end

  def contact
  end

end

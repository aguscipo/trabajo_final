class CartController < ApplicationController
  before_action :logged_in_user

  def add
    id = params[:id]
    product=Product.find(id)
    cart= session[:cart]
    if cart[id]
      if product.stock > cart[id]
        cart[id] +=1
      else
      flash[:danger] = t(:limit_stock) +  product.name
      end
    else
      cart[id]=1
    end
    redirect_to :action => :index
  end

  def remove
    id = params[:id]
    session[:cart].delete(id)
    redirect_to :action => :index
  end

  def index
    @cart = session[:cart]
    flash.now[:info] =  t(:empty_shopping_cart) if @cart.length == 0
  end

  def increment
    id = params[:id]
    cart= session[:cart]
    product=Product.find(id)
    cart[id]+=1  if product.stock > cart[id]
    redirect_to :action => :index
  end

  def decrement
    id = params[:id]
    cart= session[:cart]
    cart[id]-=1 unless cart[id]==1
    redirect_to :action => :index
  end
end

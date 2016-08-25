module CartHelper
  def cart_quantity
    cart = session[:cart]
    quantity=0
    cart.each do |id, q|
        quantity+=q
    end
    return quantity
  end
end

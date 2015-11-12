require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  def setup
    @product = products(:one)
  	@non_admin_user = users(:archer)
  end

  test "should redirect create when logged in as a non-admin" do
  	log_in_as(@non_admin_user)
  	assert_no_difference 'Product.count' do
  		post :create, product: {name: "Impresora HL-1212",
                              description: "Impresora Monofunción. Segmento Oficina y Profesionales. Teconología de Impresión Laser. Resolución de Impresión 2400x600dpi ",
                              category: "Impresora",
                              price: 2000,
                              stock: 10,
                              code: "1",
                              trademark: "Epson"}
  	end
  	assert_redirected_to root_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@non_admin_user) 	
  	assert_no_difference 'Product.count' do
  		delete :destroy, id: @product
  	end
  	assert_redirected_to root_url
  end

  test "should redirect edit when logged in as a non-admin" do
    log_in_as(@non_admin_user) 
    get :edit, id: @product
    assert_redirected_to root_url 
  end

  test "should redirect update when not logged in" do
    patch :update, id: @product, product: { name: @product.name }
    assert_redirected_to root_url
  end
end

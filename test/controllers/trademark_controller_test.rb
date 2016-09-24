require 'test_helper'

class TrademarkControllerTest < ActionController::TestCase
  def setup
    @trademark =trademarks(:one)
  	@non_admin_user = users(:archer)
  end

  test "should redirect create when logged in as a non-admin" do
  	log_in_as(@non_admin_user)
  	assert_no_difference 'Trademark.count' do
  		post :create, category: {name: "Dell"}
  	end
  	assert_redirected_to root_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@non_admin_user)
    assert_no_difference 'Category.count' do
      delete :destroy, name: @category.name
    end
    assert_redirected_to root_url
  end

  test "should redirect edit when logged in as a non-admin" do
    log_in_as(@non_admin_user)
    get :edit, name: @category.name
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as a non-admin" do
    patch :update, name: @category.name, category: { name: @category.name }
    assert_redirected_to root_url
  end
end

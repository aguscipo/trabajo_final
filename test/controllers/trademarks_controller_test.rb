require 'test_helper'

class TrademarksControllerTest < ActionController::TestCase
  def setup
    @trademark =trademarks(:one)
  	@non_admin_user = users(:archer)
  end

  test "should redirect create when logged in as a non-admin" do
  	log_in_as(@non_admin_user)
  	assert_no_difference 'Trademark.count' do
  		post :create, trademark: {name: "Asus"}
  	end
  	assert_redirected_to root_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@non_admin_user)
    assert_no_difference 'Trademark.count' do
      delete :destroy, name: @trademark.name
    end
    assert_redirected_to root_url
  end

  test "should redirect edit when logged in as a non-admin" do
    log_in_as(@non_admin_user)
    get :edit, name: @trademark.name
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as a non-admin" do
    patch :update, name: @trademark.name, category: { name: @trademark.name }
    assert_redirected_to root_url
  end
end

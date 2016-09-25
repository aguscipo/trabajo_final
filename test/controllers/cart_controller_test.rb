require 'test_helper'

class CartControllerTest < ActionController::TestCase
  def setup
  	@logged_in_user = users(:archer)
  end

  test "should redirect add when not logged in" do
    get :add
    assert_redirected_to login_url
  end
end

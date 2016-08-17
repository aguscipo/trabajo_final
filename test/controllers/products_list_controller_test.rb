require 'test_helper'

class ProductsListControllerTest < ActionController::TestCase
  test "should get filter_by_trademark" do
    get :filter_by_trademark
    assert_response :success
  end

end

require 'test_helper'

class ProductCreateTest < ActionDispatch::IntegrationTest
  def setup
   @admin_user = users(:michael)
  end


  test "invalid product creation" do
    log_in_as(@admin_user)
    get new_product_path
    assert_no_difference 'User.count' do
      post products_path, product: {name:  ""}
    end
    assert_template 'products/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid product creation" do
    log_in_as(@admin_user)
    get new_product_path
    assert_difference 'Product.count', 1 do
      post products_path, product: { name: "Example Product",
                                     price: 1000,
                                     stock: 1,
                                     description: "Example Description",
                                     category_id:1,
                                     code: "100",
                                     trademark_id:1,
                                     }
    end
  end
end

require 'test_helper'

class ProductsCreateTest < ActionDispatch::IntegrationTest

    def setup
      @admin = users(:michael)
    end

  test "create valid product" do
    log_in_as(@admin)
    get new_product_path
    assert_difference 'Product.count', 1 do
      post products_path, product: { name:  "Notebook HP Pavilion 15-AK001laa",
                                     category_id: 1,
                                     trademark_id:1,
                                     description:'Pantalla de 15.6" - Core i5 - Memoria de 8 GB - Disco duro de 1 TB - Color Negro',
                                     price:10000,
                                     stock:10,
                                     code:1,
                                     offer:false }
    end

  end

  test "create invalid product" do
    log_in_as(@admin)
    get new_product_path
    assert_no_difference 'Product.count' do
      post products_path, product: { name:  "",
                                     category_id: 1,
                                     trademark_id:1,
                                     description:'Invalid product',
                                     price:10000,
                                     stock:10,
                                     code:1,
                                     offer:false }
    end
  end
end

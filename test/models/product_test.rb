require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def setup
    @product=Product.new(name:'Notebook HP Pavilion 15-AK001la',category_id: 1, trademark_id:1,
                         description:'Pantalla de 15.6" - Core i5 - Memoria de 8 GB - Disco duro de 1 TB - Color Negro',
                         price:10000, stock:10, code:1, offer:false)
  end

  test "should be valid" do
    assert @product.valid?
  end

  test "name should not be too long" do
    @product.name = "a" * 101
    assert_not @product.valid?
  end

  test "name should be present" do
    @product.name = "     "
    assert_not @product.valid?
  end

  test "name should be unique" do
    duplicate_product = @product.dup
    @product.save
    assert_not duplicate_product.valid?
  end

  test "order should be most recent first" do
    assert_equal products(:most_recent), Product.first
  end
end

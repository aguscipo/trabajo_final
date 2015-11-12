require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "order should be most recent first" do
    assert_equal products(:most_recent), Product.first
  end
end

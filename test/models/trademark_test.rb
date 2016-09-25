require 'test_helper'

class TrademarkTest < ActiveSupport::TestCase
  def setup
    @trademark=Trademark.new(name:'HP')
  end

  test "should be valid" do
    assert @trademark.valid?
  end

  test "name should not be too long" do
    @trademark.name = "a" * 51
    assert_not @trademark.valid?
  end

  test "name should be present" do
    @trademark.name = "     "
    assert_not @trademark.valid?
  end

  test "name should be unique" do
    duplicate_trademark = @trademark.dup
    @trademark.save
    assert_not duplicate_trademark.valid?
  end
end

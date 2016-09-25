require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  test "should redirect create when not logged in" do
    assert_no_difference 'Payment.count' do
  	post :create, payment: {card_holder: "visa",
                            card_number: "4509 9535 6623 3704",
                            amount: 2000,
                            doc_number: "35399876",
                            doc_type: "DNI"}
  	end
  	assert_redirected_to login_url
  end

  test "should redirect new when not logged in" do
    get :new
    assert_redirected_to login_url
  end
end

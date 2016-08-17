class PaymentsController < ApplicationController
  before_action :logged_in_user
  def new
    @payment = Payment.new
  end

  def create
    	$mp = MercadoPago.new('TEST-5640660696498136-080316-544feb8227681243019101f924b99726__LD_LC__-12055441')
    		$mp.sandbox_mode(true)
    		paymentData = Hash[
    				"transaction_amount" => 100,
    				"token" => params[:token],
    				"description" => "Title of what you are paying for",
    				"installments" => 1,
    				"payment_method_id" => "visa",
    				"payer" => Hash[
    					"email" => "test_user_123456@testuser.com"
    				]
    			]
    		payment = $mp.post("/v1/payments", paymentData);
    		@payment=payment
    		@paymentData=paymentData
    		render 'payment'
  end
  
  def edit
  end

  def update
  end

  def delete
  end
end

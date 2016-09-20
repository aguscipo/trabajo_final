class PaymentsController < ApplicationController
  before_action :logged_in_user

  def new
    @payment = Payment.new
    @amount = params[:amount]
  end

  def create
  	$mp = MercadoPago.new(Rails.application.secrets.access_token_mercadopago)
  	$mp.sandbox_mode(true)
    paymentData = Hash[
				"transaction_amount" => params[:amount].to_f,
				"token" => params[:token],
				"description" => "Descrition",
				"installments" => 1,
				"payment_method_id" => params[:payment][:card_holder],
				"payer" => Hash[
					"email" => params[:email]
				]
			]
  		payment = $mp.post("/v1/payments", paymentData);
      if payment["response"]["status"] == "approved"
        @payment = Payment.new(payment_params)
        @payment.user=User.find_by(email: params[:email])
        cart = session[:cart]
        cart.each do |id, quantity|
          product=Product.find(id)
          if quantity <= product.stock
            quantity.times do
              @payment.products<<product
            end
            product.update_attribute(:stock, product.stock - quantity)
          else
            flash[:danger] = t(:no_stock) +  product.name
            session[:cart].delete(id)
            redirect_to root_url and return
         end
        end
        session[:cart]={}
        @payment.amount=params[:amount]
        if @payment.save
          flash[:success] = t(:payment_success)
        else
          render 'new'
        end
      else
        flash[:danger] = t(:payment_error)
      end
      redirect_to root_url and return
  end

  def edit
  end

  def update
  end

  def delete
  end

  private
    def payment_params
        params.require(:payment).permit(:card_number, :card_holder, :doc_number, :amount,:doc_type)
    end
end

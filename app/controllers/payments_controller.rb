class PaymentsController < ApplicationController
  before_action :logged_in_user

  def new
    @payment = Payment.new
    @amount = params[:amount]
  end

  def create
    $mp = MercadoPago.new(Rails.application.secrets.access_token_mercadopago)
    @payment = Payment.new(payment_params)
    @payment.user=User.find_by(email: params[:email])
    @payment.payment_data= { transaction_amount: @payment.amount, token: params[:token],	description: "Description", installments: 1,
                            payment_method_id: @payment.card_holder, payer: Hash[email:@payment.user.email] }
    @payment.result = $mp.post("/v1/payments", @payment.payment_data)
    if @payment.approved?
      cart = session[:cart]
      cart.each do |id, quantity|
        product=Product.find(id)
        if quantity <= product.stock #Has stock
          quantity.times do
            @payment.add product
          end
          product.update_attribute(:stock, product.stock - quantity)
        else #No stock
          flash[:danger] = t(:no_stock) +  product.name
          session[:cart].delete(id)
          redirect_to root_url and return
        end
      end #finish cart iteration
      session[:cart]={}
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

class PaymentsController < ApplicationController
  before_action :logged_in_user

  def new
    @payment = Payment.new
    @amount = params[:amount]
  end

  def create
    	$mp = MercadoPago.new('TEST-5640660696498136-080316-544feb8227681243019101f924b99726__LD_LC__-12055441')
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
              flash[:danger] = 'Lo sentimos no hay stock disponible para ' +  product.name
              session[:cart].delete(id)
              redirect_to root_url and return
           end
          end
          session[:cart]={}
          @payment.amount=params[:amount]
          if @payment.save
            flash[:success] = '¡Listo, se acreditó su pago! Muchas gracias por su compra'
          else
            render 'new'
          end
        else
          flash[:danger] = 'Lo sentimos su pago no se ha acreditado. Por favor intente nuevamente'
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

class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Cuenta activada!"
      redirect_to root_url
    else
      flash[:danger] = "Link de activación invalido"
      redirect_to root_url
    end
  end
end

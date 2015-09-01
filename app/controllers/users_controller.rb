class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Le damos la bienvenida a AC informática!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params#Cuando se hace el submit del form solo se permiten estos parametros (strong parameters)
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end

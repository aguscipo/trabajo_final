class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy, :index]

  def index
    @users = User.paginate(page: params[:page], :per_page => 10)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t(:delete_user)
    redirect_to users_url
  end

  def new
    @user = User.new
  end

  def show
    redirect_to root_url
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = t(:check_mail)
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = t(:update_user)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def unsubscribe
    user = User.find_by(email: params[:email])
    user.update_attribute :subscription, false
    flash[:info] = t(:cancel_subscription)
    redirect_to(root_url)
  end

  private

    def user_params #Cuando se hace el submit del form solo se permiten estos parametros (strong parameters)
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :subscription)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end

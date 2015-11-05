class UsersController < ApplicationController
  skip_before_action :current_user_present?, only: [:new, :create]

  def new
    if User.find_by(id: session[:user_id])
      redirect_to root_url
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # tell UserMailer to send a account activation email after save
      UserMailer.account_activation(@user).deliver_now
      flash[:notice] = "Please check your e-mail to activate your account."
      redirect_to root_url
    else
      render "new"
    end
  end

  def show
    @user = current_user
    # @item = @user.items.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if User.authenticate(@user.email, params[:user][:current_password])
      if @user.update_attributes(user_params)
        flash[:notice] = "Your profile has been updated!"
        redirect_to root_url
      else
        flash.now[:error] = "Oops, please try again."
        render 'edit'
      end
    else
      flash.now[:error] = "Please enter your password."
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

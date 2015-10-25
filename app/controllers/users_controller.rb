class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # respond_to do |format|
    if @user.save
      # tell UserMailer to send a account activation email after save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your e-mail to activate your account."
      # format.html { redirect_to(root_url, notice: 'User was successfully created.') }
      # format.json { render json: @user, status: :created, location: @user }
      redirect_to root_url
    else
      # format.html { render action: 'new' }
      # format.json { render json: @user.errors, status: :unprocessable_entity }
      render "new"
    end
  end

  def show
    @user = current_user
    @items = @user.items
    @item = @user.items.build
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

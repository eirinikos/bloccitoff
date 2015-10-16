class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # tell UserMailer to send a welcome email after save
        UserMailer.welcome_email(@user).deliver_now
        format.html { redirect_to(root_url, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
        # redirect_to root_url, :notice => "Signed up!"
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        # render "new"
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

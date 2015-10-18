class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user && User.authenticate(params[:email], params[:password])
      if user.activated?
        log_in user
        redirect_to root_url, :notice => "Logged in!"
      else
        message = "Account not activated."
        message += "Check your e-mail for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Invalid email or password."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end

class SessionsController < ApplicationController
  skip_before_action :current_user_present?, only: [:new, :create, :destroy]

  def new
    if User.find_by(id: session[:user_id])
      redirect_to root_url
    end
  end

  def create
    if user = User.authenticate(params[:session][:email], params[:session][:password])
      if user.activated?
        # render page for current_user
        log_in user
        redirect_to root_url, :notice => "Hello again!"
      else
        message = "Account not activated."
        message += "Check your e-mail for the activation link."
        flash.now[:alert] = message
        redirect_to root_url
      end
    else
      flash.now[:error] = "Invalid email or password."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
    flash[:notice] = "Goodbye!"
  end
end

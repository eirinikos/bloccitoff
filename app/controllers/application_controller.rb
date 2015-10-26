class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :current_user_present?
  helper_method :current_user

  protect_from_forgery with: :exception

  private

  def current_user_present?
    unless User.find_by(id: session[:user_id])
      redirect_to log_in_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end

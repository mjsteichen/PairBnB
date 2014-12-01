class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # helper ApplicationHelper

  include ApplicationHelper

  # def current_user
  #   @user ||= User.find(session[:user_id])
  # end

  def signed_in?
    current_user_id.present?
  end
  def current_user_id
    session[:user_id]
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # helper ApplicationHelper

  include ApplicationHelper

  before_filter :require_authenticated

  # def current_user
  #   @user ||= User.find(session[:user_id])
  # end

  def signed_in?
    current_user_id.present?
  end

  def require_authenticated
    if !signed_in?
      flash[:notice] = "You must be logged in to access that feature."
      redirect_to new_session_path
    end
  end

  def current_user_id
    session[:user_id]
  end
end

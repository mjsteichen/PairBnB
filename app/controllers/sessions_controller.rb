class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @error_message = "Invalid Email or Password"
      render "sessions/new"
    end
  end

  def destroy

    session.clear
    redirect_to root_path
  end
end

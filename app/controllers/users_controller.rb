class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.id != session[:user_id]
      session.clear
      redirect_to root_path
    else
      @availabilities = @user.availabilities
      @messages = @user.received_messages.order(:id).reverse_order
      @residences = @user.residences
      @residence = Residence.new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], picture_url: params[:user][:picture_url], github_url: params[:user][:github_url], twitter_url: params[:user][:twitter_url], bio: params[:user][:bio])
    redirect_to user_path(@user)
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end

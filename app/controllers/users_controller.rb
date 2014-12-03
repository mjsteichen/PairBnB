class UsersController < ApplicationController
  # before_filter :load_user
  # def load_user
  #   @user = User.find(params[:id])
  # end
  # def lookup_user
  # User.find(params[:id])
  # end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:welcome] = " Welcome to PairBnB!  This calendar holds your availabilities.  Click a date to create a new availability, click again to remove it!  If you accept a request, the date that you accept will show red.       "
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    # if @user.id != logged_in_user_id
    # if is_logged_on_user?(@user)
    # if is_logged_on_user?(params[:id])  - Then take the User.find and move it into the else
    if @user.id != session[:user_id]
      session.clear
      redirect_to root_path
    else
      @requests = @user.received_requests.order(:id).reverse_order
      @availabilities = @user.availabilities
      @received_messages = @user.received_messages.order(:id).reverse_order
      @sent_messages = @user.sent_messages.order(:id).reverse_order
      @residences = @user.residences
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.attributes = {name: params[:user][:name], email: params[:user][:email], picture_url: params[:user][:picture_url], github_url: params[:user][:github_url], twitter_url: params[:user][:twitter_url], bio: params[:user][:bio]}
    if @user.save(:validate => false)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end

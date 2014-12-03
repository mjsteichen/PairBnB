class ResidencesController < ApplicationController
  def index
    @residences = Residence.all
  end

  def search

    @residences = Residence.where(city: params[:search])
    if @residences.length == 0
      flash.now[:notice] = "Sorry! No pairs in that neck of the woods."
    end
  end

  def show
    @message = Message.new
    @residence = Residence.where(id:params[:id]).includes(:user => {:received_shoutouts => :sender}).first
    @user = @residence.user
  end

  def new
    @residence = Residence.new
  end

  def create
    @residence = Residence.new(residence_params)
    @residence.user_id = current_user.id
    if @residence.save
      redirect_to residence_path(@residence)
    else
      render 'new'
    end
  end

  def update
    @residence = Residence.find(params[:id])
    @user = @residence.user
    @residence.update(city: params[:residence][:city], state: params[:residence][:state], zip_code: params[:residence][:zip_code], description: params[:residence][:description])
    redirect_to user_path(@user)
  end

  def edit
    @user = User.find(params[:id])
    @residence = @user.residences.first
  end

  def destroy
    @residence = Residence.find(params[:id].to_i)
    @residence.destroy!
    redirect_to user_path(current_user)
  end

  private
    def residence_params
      params.require(:residence).permit(:city, :state, :zip_code, :description)
    end
end

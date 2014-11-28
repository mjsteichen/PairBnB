class ResidencesController < ApplicationController
  def index
    @residences = Residence.all
  end

  def show
    @residence = Residence.find(params[:id])
    @user = User.find(@residence.user.id)
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
  end

  def destroy
  end

  private
    def residence_params
      params.require(:residence).permit(:city, :state, :zip_code, :description)
    end
end

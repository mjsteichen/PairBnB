class AvailabilitiesController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    if Availability.where(residence_id: @user.residences.first.id).where(date: params[:date]).length == 0
      availability = Availability.create!(residence_id: @user.residences.first.id, date: params[:date])
      day = availability.date[-2..-1]
      render json: { id: availability.id, day: day }
    else
      redirect_to user_path(@user)
    end
  end

  def destroy
    binding.pry
    @user = User.find(params[:user_id])
    availability = Availability.find(params[:id])
    if availability
      availability.destroy
    end

    render json: { id: availability.id }
  end

end



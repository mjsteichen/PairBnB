class AvailabilitiesController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    if Availability.where(residence_id: params[:residence].to_i).where(date: params[:date]).length == 0
      availability = Availability.create!(residence_id: @user.residences[params[:residence].to_i].id, date: params[:date])
      day = availability.date[-2..-1]
      render json: { id: availability.id, day: day }
    else
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    availability = Availability.find(params[:id])
    if availability
      availability.destroy
    end
    redirect_to user_path(@user)
  end

end



class AvailabilitiesController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    binding.pry
    if Availability.where(date: params[:date]).length == 0
      Availability.create!(residence_id: @user.residences[params[:residence].to_i].id, date: params[:date])
    end
    redirect_to user_path(@user)
  end

  def destroy

  end

end

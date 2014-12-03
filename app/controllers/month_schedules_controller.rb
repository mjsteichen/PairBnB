class MonthSchedulesController < ApplicationController
  def show
    user = User.find(params[:user_id])

    availabilities = user.availabilities.where("date LIKE '#{params[:year]}-#{params[:month]}-%'")

    month_schedule = availabilities.map do |availability|
      {day: availability.day.to_i,
       availability_id: availability.id,
       pairing_id: availability.pairing_id}
    end

    render json: month_schedule
  end
end

class PairingsController < ApplicationController

  def create
    @pairing = Pairing.new(host_id: params[:recipient], visitor_id: params[:sender])
    if @pairing.save
      @availability = Availability.find_by(residence_id: params[:residence], date: params[:date])
      binding.pry
      @availability.update(booked: true, pairing_id: @pairing.id)
    end
    redirect_to user_path(current_user)
  end

end

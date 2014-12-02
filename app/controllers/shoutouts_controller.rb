class ShoutoutsController < ApplicationController

  def new
    @shoutout = Shoutout.new
  end

  def create
    @shoutout = Shoutout.new(recipient_id: params[:pairing_id], sender_id: current_user.id, text: params[:shoutout][:text])
    if @shoutout.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end

  end

  def destroy
  end
end

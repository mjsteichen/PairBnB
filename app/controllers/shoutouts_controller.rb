class ShoutoutsController < ApplicationController

  def new
    @shoutout = Shoutout.new
  end

  def create
    @shoutout = Shoutout.new(recipient_id: params[:pairing_id], sender_id: current_user.id, text: params[:shoutout][:text])
    if @shoutout.save
      flash[:notice] = "Your message was successfully sent! Thanks for contributing to the PairBnB community."
      redirect_to user_path(current_user)
    else
      render 'new'
    end

  end

  def destroy
  end
end

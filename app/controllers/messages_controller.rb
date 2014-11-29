class MessagesController < ApplicationController
  def show
  end

  def new
    binding.pry
    @message = Message.new
  end

  def create
    binding.pry
    @residence = params[:residence]
    @user = User.find(params[:user_id])
    @message = Message.new(recipient_id: params[:user_id], text:params[:message][:text], sender_id: current_user.id )
    if @message.save
      # binding.pry
      redirect_to residence_path(@residence)
    else
      binding.pry
      render 'new'
    end
  end

  def destroy
  end

end

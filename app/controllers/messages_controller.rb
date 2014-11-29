class MessagesController < ApplicationController
  def show
  end

  def new
    @message = Message.new
  end

  def create
    @residence = params[:residence]
    @user = User.find(params[:user_id])
    @message = Message.new(recipient_id: params[:user_id], text:params[:message][:text], sender_id: current_user.id )
    if @message.save
      redirect_to residence_path(@residence)
    else
      render 'new'
    end
  end

  def destroy
  end

end

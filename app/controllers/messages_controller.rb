class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def reply  # used to have an if-else statement that rendered '/users/show' if message save failed
    if session[:user_id]
      @recipient = User.find(params[:recipient])
      @message = Message.new(recipient_id: @recipient.id, text: params[:message][:text], sender_id: session[:user_id])
      @message.save
      redirect_to user_path(current_user)
    end
  end

  def create
    @residence = params[:residence]
    @user = User.find(params[:user_id])
    @message = Message.new(recipient_id: params[:user_id], text:params[:message][:text], sender_id: session[:user_id] )
    if @message.save
      redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
  end

  def destroy
  end

end

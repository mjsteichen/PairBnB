class RequestsController < ActionController::Base

  def create
    if session[:user_id]
      @residence = Residence.find(params[:residence])
      @request = Request.new(text: params[:request][:text], residence_id: params[:residence], date: params[:date], sender_id: session[:user_id])
      @request.save
      redirect_to residence_path(@residence)
    end
  end

  def destroy
    @request = Request.find_by(sender_id: params[:sender], date: params[:date])
    if @request
      @request.destroy
    end
    redirect_to user_path(User.find(session[:user_id]))
  end

end

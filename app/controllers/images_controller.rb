class ImagesController < ApplicationController
  def create
    @image = Image.new(residence_id: params[:residence_id], url:params[:image][:url])
    if @image.save
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to user_path(current_user)
  end
end

class PhotosController < ApplicationController


  def index
    render json: Photo.all.as_json(include: [:user, :likes=>{include: [:user]}, :comments=>{include: [:user]}])
  end

  def show
    render json: Photo.find(params[:id]).as_json(include: [:user, :likes])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      render json: @photo
    else
      render json: { :errors => @photo.errors.full_messages }
    end
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = User.find(session[:user_id])
    if @photo.save
      render json: @photo
    else
      render json: { :errors => @photo.errors.full_messages }
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    render json: {status: "destroyed #{@photo.title}"}
  end


  private
  def photo_params
    params.require(:photo).permit(:title, :picture, :description)
  end


end

class PhotosController < ApplicationController


  def index
    render json: Photo.all.order("photos.id DESC").includes(:comments).order('comments.id ASC').as_json(include: [:user, :likes=>{include: [:user]}, :comments=>{include: [:user]}])
  end

  def show
    render json: Photo.find(params[:id]).as_json(include: [:user, :likes])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      render json: { update: "Photo successfully updated"}
    else
      render json: { :errors => @photo.errors.full_messages }
    end
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = User.find(session[:user_id])
    if @photo.save
      render json: { create: "photo successfully created"}
    else
      render json: { :errors => @photo.errors.full_messages }
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    render json: {delete: "Photo successfully deleted"}
  end


  private
  def photo_params
    params.require(:photo).permit(:title, :picture, :description)
  end


end

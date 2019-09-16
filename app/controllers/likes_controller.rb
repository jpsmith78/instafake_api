class LikesController < ApplicationController

  def index
    render json: Like.all.as_json(include: [:user])
  end

  def create
    @like = Like.new(like_params)

    if already_liked?
      render json: { :warning => "You've already liked this" }
    elsif @like.save
      render json: @like
    else
      render json: { :errors => @like.errors.full_messages }
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    render json: {delete: "You have unliked this"}
  end


  private
  def like_params
    params.require(:like).permit(:user_id, :photo_id)
  end

  def already_liked?
    Like.where(user_id: like_params[:user_id], photo_id: like_params[:photo_id]).exists?
  end

end

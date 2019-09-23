class CommentLikesController < ApplicationController

  def index
    render json: CommentLike.all.as_json(include: [:user])
  end

  def create
    @comment_like = CommentLike.new(comment_like_params)

    if already_liked?
      render json: { :errors => ["You've already liked this"] }
    elsif @comment_like.save
      render json: { create: "You have liked this" }
    else
      render json: { :errors => @comment_like.errors.full_messages }
    end
  end

  def destroy
    @comment_like = CommentLike.find(params[:id])
    @comment_like.destroy
    render json: {delete: "You have unliked this"}
  end


  private
  def comment_like_params
    params.require(:comment_like).permit(:user_id, :comment_id)
  end

  def already_liked?
    CommentLike.where(user_id: comment_like_params[:user_id], comment_id: comment_like_params[:comment_id]).exists?
  end

end

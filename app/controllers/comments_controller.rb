class CommentsController < ApplicationController

  def index
    render json: Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: { :errors => @comment.errors.full_messages }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :photo_id)
  end

end

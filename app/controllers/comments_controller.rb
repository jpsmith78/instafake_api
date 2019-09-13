class CommentsController < ApplicationController

  def index
    render json: Comment.all.as_json(include: [:user])
  end

  def show
    render json: Comment.find(params[:id]).as_json(include: [:user])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: { :errors => @comment.errors.full_messages }
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: { :errors => @comment.errors.full_messages }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: {status: "destroyed comment"}
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :photo_id)
  end

end
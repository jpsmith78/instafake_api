class UsersController < ApplicationController

  def index
    render json: User.all.as_json(include: [:photos])
  end

  def show
    render json: User.find(params[:id]).as_json(include: [:photos])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user
  end

  def create
    @user = User.new(user_params)
    @user.save
    render json: @user

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {status: "destroyed #{@user.username}"}
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


end

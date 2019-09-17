class UsersController < ApplicationController

  def index
    render json: User.all.as_json(include: [:likes, :photos=>{include: [:likes]}])
  end

  def show
    render json: User.find(params[:id]).as_json(include: [:photos, :likes])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: { :errors => @user.errors.full_messages}
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { create: "User successfully created" }
    else
      render json: { :errors => @user.errors.full_messages }
    end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: { delete: "User successfully deleted" }
  end

  private

  def user_params
    params.require(:user).permit(:username, :image, :email, :password)
  end


end

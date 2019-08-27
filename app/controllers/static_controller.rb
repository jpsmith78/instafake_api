class StaticController < ApplicationController

  def home
    render json: { status: "You're on the rails!"}
  end

end

class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @castle = Castle.find(params[:castle_id])
    if current_user.favourite_castles.include?(@castle)
      render json: { message: "Castle is already favourited!" }, status: :unprocessable_entity
    elsif current_user.favourite_castles << @castle
      render json: { message: "Castle has been favourited!" }, status: :ok
    else
      render json: { errors: @castle.errors.full_messages }, status: :unprocessable_entity
    end
  end




  def destroy
    @castle = Castle.find(params[:castle_id])
    if current_user.favourite_castles.include?(@castle)
      current_user.favourite_castles.delete(@castle)
      render json: { message: "Castle has been unfavourited!" }, status: :ok
    else
      render json: { message: "Castle is not in favourites!" }, status: :unprocessable_entity
    end
  end
end

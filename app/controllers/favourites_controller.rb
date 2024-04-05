class FavouritesController < ApplicationController

  def create
    @castle = Castle.find(params[:castle_id])
    current_user.favourite_castles << @castle
    render json: { message: "Castle has been favourited!" }, status: :ok
  end

  def destroy
    @castle = Castle.find(params[:castle_id])
    current_user.favourite_castles.delete(@castle)
    render json: { message: "Castle has been unfavourited!" }, status: :ok
  end
end

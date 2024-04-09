class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def new
    @favourite = Favourite.new
  end

  def create
    @castle = Castle.find(params[:castle_id])
    @user = current_user
    @favourite = Favourite.new(favourite_params)
    @favourite.castle = @castle
    @favourite.user = @user

    if @favourite.save
      render json: { message: "Castle has been favourited!" }, status: :ok
    else
      render json: { errors: @favourite.errors.full_messages }, status: :unprocessable_entity
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

  private

  def favourite_params
    params.permit(:castle_id)
  end

end

class CastlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    # @castles = current_user.castles # for bookings? or dashboard?
      @castles = Castle.all
  end

  def show
    @castle = Castle.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @castle = Castle.new
  end

  def create
    @user = User.find(params[:user_id])
    @castle = Castle.new(castle_params)
    @castle.user = @user

    if @castle.save
      redirect_to user_castles_path(@castle)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @castle = Castle.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @castle = Castle.find(params[:id])
    @castle.update(castle_params)
    redirect_to castle_path(@castle)
  end

  def destroy
    @castle = Castle.find(params[:id])
    @castle.destroy
    redirect_to castles_path, status: :see_other
  end

  def add_to_favorites
    session[:favourites] ||= []
    session[:favourites] << params[:id].to_i
    render json: { message: 'Castle has been favorited' }, status: :ok
  end

  def remove_from_favorites
    session[:favourites]&.delete(params[:id].to_i)
    render json: { message: 'Castle has been unfavorited' }, status: :ok
  end


  private

  def castle_params
    params.require(:castle).permit(:name, :location, :price, :description, :rating, :image, :user_id)
  end
end

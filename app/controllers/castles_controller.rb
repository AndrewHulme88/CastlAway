class CastlesController < ApplicationController
  def index
    @castles = Castle.all
    @markers = @castles.geocoded.map do |castle|
      {
        lat: castle.latitude,
        lng: castle.longitude
      }
    end
  end

  def show
    @castle = Castle.find(params[:id])
  end

  def new
    @castle = Castle.new
  end

  def create
    @castle = Castle.new(castle_params)
    if @castle.save
      redirect_to castle_path(@castle)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @castle = Castle.find(params[:id])
  end

  def update
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
    params.require(:castle).permit(:name, :location, :price, :description, :rating, :image)
  end
end

class CastlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @castles = if params[:query].present?
      Castle.search_by_name_and_location(params[:query])
    else
      Castle.all
    end

    @markers = @castles.geocoded.map do |castle|
      {
        castle_id: castle.id, # Include castle_id attribute
        lat: castle.latitude,
        lng: castle.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {castle: castle}),
        marker_html: render_to_string(partial: "marker", locals: {castle: castle})
      }
    end
  end

  def show
    @castle = Castle.find(params[:id])
    @booking = Booking.find_or_initialize_by(user: current_user, castle: @castle)
    #do |booking|
    #   booking.to = Date.today
    #   booking.from = Date.today
    #   booking.total_price = 0
    # end
    # @booking.save! if @booking.new_record?
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
    @user = User.find(params[:user_id])
    @castle = Castle.find(params[:id])
    @castle.destroy
    redirect_to root_path, notice: 'Castle listing was successfully deleted.'
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

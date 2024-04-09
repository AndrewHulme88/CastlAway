class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @user = current_user
    @castle = Castle.find(params[:castle_id])
    @booking = Booking.new
  end

  def create
    @castle = Castle.find(params[:castle_id])
    @booking = Booking.new(booking_params)
    @booking.castle = @castle
    @booking.user = current_user

    # Calculate duration
    duration = (@booking.to - @booking.from).to_i

    # Calculate total price (assuming price_per_day is a column in your Castle model)
    @booking.total_price = duration * @castle.price

    if @booking.save
      redirect_to user_castles_path(@castle), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:to, :from, :total_price, :castle_id)
  end
end

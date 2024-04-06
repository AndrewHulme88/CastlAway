class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(booking_params)
  end

  def new
    @user = current_user
    @castle = Castle.find(params[:castle_id])
    @booking = Booking.new
  end

  def create
    @user = User.find(params[:user_id])
    @castle = Castle.find(params[:castle_id])
    @booking = Booking.new(booking_params)
    @booking.castle = @castle
    @booking.user = current_user

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

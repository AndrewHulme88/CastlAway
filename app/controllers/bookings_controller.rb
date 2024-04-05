class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @castle = Castle.find(params[:castle_id])
    @booking = Booking.new
  end

  def create
    @castle = Castle.find(params[:castle_id])
    @booking = current_user.bookings(booking_params)
    @booking.castle = @castle

    if @booking.save
      redirect_to @castle, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:to, :from, :total_price, :castle_id, :user_id)
  end
end

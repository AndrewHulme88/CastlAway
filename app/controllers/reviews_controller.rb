class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @castle = Castle.find(params[:castle_id])
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = @booking.reviews.build(review_params)
    puts "Current User: #{current_user.inspect}" # Add this line
    @review.user_id = current_user.id

    if @review.save
      render json: { message: "Review created successfully" }, status: :created
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private

  def review_params
    params.require(:review).permit(:content, :rating, :booking_id)
  end
end

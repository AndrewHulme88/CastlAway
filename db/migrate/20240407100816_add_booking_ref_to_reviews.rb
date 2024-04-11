class AddBookingRefToReviews < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:reviews, :booking_id)
    add_reference :reviews, :booking, null: false, foreign_key: true
    end
  end
end

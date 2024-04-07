class RemoveBookingsIdFromReviews < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :bookings_id
  end
end

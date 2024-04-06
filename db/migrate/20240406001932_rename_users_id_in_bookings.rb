class RenameUsersIdInBookings < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :users_id, :user_id
  end
end

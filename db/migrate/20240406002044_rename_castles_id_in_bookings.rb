class RenameCastlesIdInBookings < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :castles_id, :castle_id
  end
end

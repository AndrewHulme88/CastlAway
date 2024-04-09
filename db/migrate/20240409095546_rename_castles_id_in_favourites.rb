class RenameCastlesIdInFavourites < ActiveRecord::Migration[7.1]
  def change
    rename_column :favourites, :castles_id, :castle_id
  end
end

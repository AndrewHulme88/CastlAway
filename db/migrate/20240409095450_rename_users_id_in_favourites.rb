class RenameUsersIdInFavourites < ActiveRecord::Migration[7.1]
  def change
    rename_column :favourites, :users_id, :user_id
  end
end

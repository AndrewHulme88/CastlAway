class RenameUsersIdInCastles < ActiveRecord::Migration[7.1]
  def change
    rename_column :castles, :users_id, :user_id
  end
end

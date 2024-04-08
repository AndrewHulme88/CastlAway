class RemoveUsersIdFromReviews < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :users_id
  end
end

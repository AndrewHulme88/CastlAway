class AddUserRefToReviews < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:reviews, :user_id)
    add_reference :reviews, :user, null: false, foreign_key: true
    end
  end
end

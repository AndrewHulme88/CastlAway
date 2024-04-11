class AddCastleIdToReviews < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:reviews, :castle_id)
    add_reference :reviews, :castle, null: false, foreign_key: true
    end
  end
end

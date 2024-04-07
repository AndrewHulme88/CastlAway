class AddCastleIdToReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :castle, null: false, foreign_key: true
  end
end

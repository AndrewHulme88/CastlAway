class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.float :rating
      t.references :user, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true
      t.references :castle
      t.timestamps null: false
    end
  end
end

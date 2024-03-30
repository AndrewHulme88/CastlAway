class CreateCastles < ActiveRecord::Migration[7.1]
  def change
    create_table :castles do |t|
      t.string :name
      t.string :location
      t.float :price
      t.text :description
      t.integer :rating
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end

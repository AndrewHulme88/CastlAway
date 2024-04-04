class AddImageToCastles < ActiveRecord::Migration[7.1]
  def change
    add_column :castles, :image, :string
  end
end

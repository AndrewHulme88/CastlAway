class Favourite < ApplicationRecord
  belongs_to :users
  belongs_to :castles
end

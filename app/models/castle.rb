class Castle < ApplicationRecord
  belongs_to :users
  validates :name, :location, :price, :description, :rating, presence: true
end

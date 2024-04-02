class Castle < ApplicationRecord
  belongs_to :user
  validates :name, :location, :price, :description, :rating, presence: true
end

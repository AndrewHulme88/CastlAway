class Castle < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :location, :price, :description, :rating, presence: true
end

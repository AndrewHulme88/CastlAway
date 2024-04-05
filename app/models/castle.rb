class Castle < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :favourites
  has_many :favourited_by, through: :favourites, source: :user
  validates :name, :location, :price, :description, :rating, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

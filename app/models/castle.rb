class Castle < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_many :favourites
  has_many :fans, through: :favourites, source: :user
  validates :name, :location, :price, :description, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end

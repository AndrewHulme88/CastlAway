class Castle < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
    against: [:name, :location],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews
  has_many :favourites
  has_many :fans, through: :favourites, source: :user
  validates :name, :location, :price, :description, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def average_rating
    reviews.average(:rating).to_f || 0.0
  end
end

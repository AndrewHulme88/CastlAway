class Review < ApplicationRecord
  belongs_to :bookings
  belongs_to :users
  validates :content, :rating, presence: true
end

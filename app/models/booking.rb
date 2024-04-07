class Booking < ApplicationRecord
  belongs_to :castle
  belongs_to :user
  has_many :reviews
  validates :to, presence: true
  validates :from, presence: true
  validates :total_price, presence: true
end

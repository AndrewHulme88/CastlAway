class Booking < ApplicationRecord
  belongs_to :castles
  belongs_to :users
  validates :to, presence: true, timeliness: { type: :date }
  validates :from, presence: true, timeliness: { type: :date }
  validates :total_price, presence: true
end

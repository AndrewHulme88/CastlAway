class Booking < ApplicationRecord
  belongs_to :castle
  belongs_to :user
  validates :to, presence: true, timeliness: { type: :date }
  validates :from, presence: true, timeliness: { type: :date }
  validates :total_price, presence: true
end

class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  belongs_to :castle
  validates :content, :rating, presence: true
end

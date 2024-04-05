class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :castles, dependent: :destroy
  has_many :bookings
  has_many :reviews
  has_many :favourites
  has_many :favourite_castles, through: :favourites, source: :castle

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end

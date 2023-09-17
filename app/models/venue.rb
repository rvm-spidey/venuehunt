class Venue < ApplicationRecord

  belongs_to :location
  has_many :reviews, dependent: :destroy

  has_many :bookings, dependent: :destroy
  has_many :carts, through: :bookings
  # belongs_to :booking

  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

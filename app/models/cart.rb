class Cart < ApplicationRecord
  belongs_to :cart
  has_many :bookings
  has_many :venues, through: :bookings
end

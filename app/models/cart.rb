class Cart < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :venues, through: :bookings
end

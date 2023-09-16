class Booking < ApplicationRecord
  belongs_to :cart
  # has_many :venues
  belongs_to :venue
end

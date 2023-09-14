class Booking < ApplicationRecord
  belongs_to :cart
  belongs_to :venue
end

class Venue < ApplicationRecord
  belongs_to :location
  has_many :reviews
  belongs_to :booking
end

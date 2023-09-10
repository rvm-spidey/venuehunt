class Venue < ApplicationRecord
  belongs_to :location
  has_many :reviews
  # belongs_to :booking

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

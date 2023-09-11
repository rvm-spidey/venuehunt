class Location < ApplicationRecord
  has_many :venues
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

class Venue < ApplicationRecord

  belongs_to :location
  belongs_to :venuetype

  has_many :reviews, dependent: :destroy

  has_many :bookings, dependent: :destroy
  has_many :carts, through: :bookings
  # belongs_to :booking

  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end

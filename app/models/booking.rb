class Booking < ApplicationRecord
  belongs_to :cart
  # has_many :venues
  belongs_to :venue

  def total_price
    unless self.number_of_participants.nil?
      self.number_of_participants * 20
    else
      0
    end
  end
end

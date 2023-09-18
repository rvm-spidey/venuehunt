class Cart < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :venues, through: :bookings, dependent: :destroy

  def sub_total
    sum = 0
    self.bookings.each do |booking|
      sum += booking.total_price
    end
    return sum
  end

  def total
    total = (sub_total * 1.15).to_i
  end
end

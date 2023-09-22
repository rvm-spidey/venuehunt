class Booking < ApplicationRecord

  PARTICIPANTS = {"0-10"=>10, "11-25"=>25, "26-50"=>50}
  FOOD_OPTIONS = {"Salads" => 100, "Pasta" => 200, "Mini croques" => 50, "Fruits" => 200}
  BEVERAGE_OPTIONS = {"Smoothies and soft drinks" => 100, "Alcoholic" => 300, "Non-alcoholic beverages" => 500}
  OTHER_SERVICES_OPTIONS = {"Room with private view" => 100, "Guided tours" => 200, "Bottle of champagne" => 300}

  PURPOSES = ["Team building", "Promotion", "Conference", "Workshop", "Presentation", "Other"]

  # has_many :venues

  belongs_to :cart
  belongs_to :venue

  validate :check_bookings_dates
  validates :event_name, :number_of_participants, :date_from, :date_to, presence: true


  # def total_price
  #   total = 0
  #   date_booked = (self.date_to - self.date_from).to_i
  #   venue_price = self.venue.price * date_booked
  #   total += venue_price

  #   if self.food.present? && FOOD_OPTIONS.key?(self.food)
  #     total += FOOD_OPTIONS[self.food]
  #   end

  #   if self.beverage.present? && BEVERAGE_OPTIONS.key?(self.beverage)
  #     total += BEVERAGE_OPTIONS[self.beverage]
  #   end

  #   if self.other_services_offered.present? && OTHER_SERVICES_OPTIONS.key?(self.other_services_offered)
  #     total += OTHER_SERVICES_OPTIONS[self.other_services_offered]
  #   end
  #   return total
  # end


  def total_price
    total = 0
    if self.event_name.present? && self.number_of_participants.present? && self.date_from.present? && self.date_to.present?
      date_booked = (self.date_to - self.date_from).to_i
      venue_price = self.venue.price * date_booked
      total += venue_price

      if self.food.present? && FOOD_OPTIONS.key?(self.food)
        total += FOOD_OPTIONS[self.food]
      end

      if self.beverage.present? && BEVERAGE_OPTIONS.key?(self.beverage)
        total += BEVERAGE_OPTIONS[self.beverage]
      end

      if self.other_services_offered.present? && OTHER_SERVICES_OPTIONS.key?(self.other_services_offered)
        total += OTHER_SERVICES_OPTIONS[self.other_services_offered]
      end
    end
    return total
  end

  def check_bookings_dates
    existing_booking = Booking.where('(date_from <= ? AND date_to >= ?)',self.date_from, self.date_to)
                              .where.not(id: self.id)
                              .count
    if existing_booking > 0
      errors.add(:date_validation, "There is already a booking")
    end
  end

end

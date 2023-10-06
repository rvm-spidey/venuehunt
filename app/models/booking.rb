class Booking < ApplicationRecord

  PARTICIPANTS = {"0-10"=>10, "11-25"=>25, "26-50"=>50}
  FOOD_OPTIONS = {"Local Cuisine Experience" => 1000, "Dinner Only" => 2000, "All inclusive" => 4000, "Continental Breakfast" => 1500}
  BEVERAGE_OPTIONS = {"Alcoholic" => 2000, "Non-alcoholic" => 4000, "Alcoholic and Non-alcoholic" => 7000 }
  OTHER_SERVICES_OPTIONS = {"Changing room with lockers" => 2000, "Guided tours" => 3000, "Land and water activities" => 4000 }

  PURPOSES = ["Team building", "Promotion", "Conference", "Workshop", "Presentation", "Other"]

  # has_many :venues

  belongs_to :cart
  belongs_to :venue

  validate :check_bookings_dates
  validates :event_name, :number_of_participants, :date_from, :date_to, presence: true

  def total_price
    total = 0
    if self.event_name.present? && self.number_of_participants.present? && self.date_from.present? && self.date_to.present?
      date_booked = (self.date_to - self.date_from).to_i
      venue_price = self.venue.price * (date_booked+1)
      total += venue_price

      if self.food.present? && FOOD_OPTIONS.key?(self.food)
        total += (FOOD_OPTIONS[self.food] * (date_booked+1) )
      end

      if self.beverage.present? && BEVERAGE_OPTIONS.key?(self.beverage)
        total += (BEVERAGE_OPTIONS[self.beverage] * (date_booked+1) )
      end

      if self.other_services_offered.present? && OTHER_SERVICES_OPTIONS.key?(self.other_services_offered)
        total += (OTHER_SERVICES_OPTIONS[self.other_services_offered] * (date_booked+1) )
      end
    end
    return total
  end

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


  def check_bookings_dates
    existing_booking = Booking.where('(date_from <= ? AND date_to >= ?)',self.date_from, self.date_to)
                              .where.not(id: self.id)
                              .where(venue: self.venue)
                              .count
    if existing_booking > 0
      errors.add(:date_validation, "There is already a booking")
    end
  end

end

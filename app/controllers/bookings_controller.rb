class BookingsController < ApplicationController
  before_action :set_venue, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.venue = @venue
    @booking.cart = current_user.carts.last
    @booking.save!
    redirect_to bookings_path
  end

  private

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

  def booking_params
    params.require(:booking).permit(:venue_id, :event_name, :number_of_participants, :date_from, :date_to)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end

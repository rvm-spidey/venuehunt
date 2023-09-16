class BookingsController < ApplicationController
  def new
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.status = "on-hold"
    @booking.save
    redirect_to cart_path(@cart)
  end

  def show
  end

  private

  def bookings_params
    params.require(:booking).permit(:event_name, :venue_id, :cart_id)
  end
end

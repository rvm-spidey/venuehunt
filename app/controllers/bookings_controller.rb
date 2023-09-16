class BookingsController < ApplicationController
  def new
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.status = "on-hold"
    @booking.total = @booking.total_price
    @booking.save
    redirect_to cart_path(@cart)
  end

  def show
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to carts_path(@cart), status: :see_other
  end

  private

  def bookings_params
    params.require(:booking).permit(:event_name, :venue_id, :cart_id, :number_of_participants)
  end
end

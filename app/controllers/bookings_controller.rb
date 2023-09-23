class BookingsController < ApplicationController
  def new
  end

  def create
    @booking = Booking.new(bookings_params)
    # @booking.venue_id = @venue.id
    # @booking.cart_id = @cart
    @booking.status = "on-hold"
    @booking.total = @booking.total_price

    respond_to do |format|
      if @booking.save
        format.html { redirect_to cart_path(@cart), notice: "Venue was successfully created." }
      else
        format.html { redirect_to venue_path(params[:venue_id]), notice: @booking.errors }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
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
    params.require(:booking).permit(:event_name, :venue_id, :cart_id, :number_of_participants, :date_from, :date_to, :food, :beverage, :other_services_offered)
  end
end

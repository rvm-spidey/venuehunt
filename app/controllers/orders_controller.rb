class OrdersController < ApplicationController

  before_action :set_order, only: [:order_success]

  def index
    @orders = Order.where(user_id: current_user.id)

    @carts = Cart.where(user_id: current_user.id)

    @my_booked_venues = []

    @carts.each do |cart|
      cart.venues.each do |venue|
        @my_booked_venues << venue if !@my_booked_venues.include?(venue)
      end
    end


  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.cart_id = @cart.id
    @order.user_id = @current_user.id
    @order.save

    if @order.save
      @cart.bookings.each do |booking|
        booking.status = "completed"
        booking.save
      end

      # remove on-hold bookings

      session[:cart_id] = nil
      redirect_to order_success_order_path(@order)
    else
      flash[:error] = "Order creation failed."
      redirect_to some_error_path
    end
  end

  def order_success
  end

  private

  def order_params
    params.require(:order).permit(:card_number, :cart, :cvc, :phone_number, :order_confirmation_email)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end

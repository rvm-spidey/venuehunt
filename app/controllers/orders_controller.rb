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
      # flash[:notice] = "This article was saved successfully"
      redirect_to order_success_order_path(@order)
    else
      render :new, status: :unprocessable_entity
    end

    # respond_to do |format|
    #   if @order.save
    #     @cart.bookings.each do |booking|
    #       booking.status = "completed"
    #       booking.save
    #     end
    #     format.html { redirect_to order_success_order_path(@order), notice: "Order was successfully created." }
    #   else
    #     flash[:error] = "Order creation failed."
    #     render :new, status: :unprocessable_entity
    #     format.json { render json: @order.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def order_success

    @cart_items = @cart

    # @cart.destroy
    session[:cart_id] = nil
  end

  private

  def order_params
    params.require(:order).permit(:card_number, :cart_type, :cart, :cvc, :exp_date, :phone_number, :order_confirmation_email)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end

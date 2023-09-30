class CartsController < ApplicationController
  def show
  end

  # def destroy
  #   @cart.destroy!
  #   redirect_to venues_path
  # end

  def destroy
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end
end

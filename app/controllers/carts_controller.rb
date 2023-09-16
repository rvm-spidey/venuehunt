class CartsController < ApplicationController

  def show
    @cart = Cart.all
  end
end

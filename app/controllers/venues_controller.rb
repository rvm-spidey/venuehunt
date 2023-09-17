class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)

    respond_to do |format|
      if @venue.save
        format.html { redirect_to venues_path, notice: "Venue was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @chatroom = Chatroom.new
    @booking = Booking.new
  end

  def edit
  end

  def update
    @venue.update(venue_params)
    redirect_to venue_path(@venue), notice: 'Equipment was successfully updated.'
  end

  def destroy
    @venue.destroy!
    redirect_to venues_path, status: :see_other
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :description, :price, :availability, :space_size, :location_id, :address, :users_id)
  end



end

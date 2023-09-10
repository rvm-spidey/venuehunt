class VenuesController < ApplicationController
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

  end

  private

  def venue_params
    params.require(:venue).permit(:name, :location_id, :address)
  end
end

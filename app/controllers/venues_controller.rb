class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def index
    @venues = Venue.all
    @searchquery = params[:search_query]
    @venuetypes = []
    @locations = []

    if params[:venuetype_id].present?
      types = params[:venuetype_id].reject(&:blank?)
      @venuetypes = types.each {|type| @venuetypes << type.to_s }
    end

    if params[:location_id].present?
      locations = params[:location_id].reject(&:blank?)
      @locations = locations.each {|location| @locations << location.to_s }
    end

    if @searchquery.present?
      @venues = Venue.search_by_name_and_description(@searchquery)
    end

    if @venuetypes.present?
      @venues = @venues.where(venuetype_id: @venuetypes)
    end

    if @locations.present?
      @venues = @venues.where(location_id: @locations)
    end

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
    @user = current_user
    @company_address =
    {
      lat:@user.latitude,
      lng:@user.longitude,
      marker_html: render_to_string(partial: "currentlocation",locals: {user: @user})
    }
    @venue_address =
    {
      lat:@venue.latitude,
      lng:@venue.longitude,
      marker_html: render_to_string(partial: "marker",locals: {user: @user})
    }

    start_date = Date.today
    # @all_bookings = Booking.where(date_from:start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week )

    @all_bookings = Booking.where(venue_id: @venue.id)
    # Booking.where(date_from:start_date.beginning_of_week..start_date.end_of_week)
  end

  def edit
  end

  def update
    @venue.update(venue_params)
    redirect_to venue_path(@venue), notice: 'Venue was successfully updated.'
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
    params.require(:venue).permit(:name, :description, :price, :availability, :space_size, :location_id, :address, :user_id, :venuetype_id, :opening_time, :closing_time, :food_beverages_offered, :other_services_offered,:show_on_homepage,  photos: [] )
  end
end

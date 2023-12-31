class LocationsController < ApplicationController

  before_action :set_location, only: [:edit, :update]

  def index
    @locations = Location.all
    @user = current_user
    @company_address =
    {
      lat:@user.latitude,
      lng:@user.longitude,
      marker_html: render_to_string(partial: "currentlocation",locals: {user: @user})
    }
    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        add: location.name,
        info_window_html: render_to_string(partial: "info_window", locals: {location: location}),
        marker_html: render_to_string(partial: "marker",locals: {location: location})
      }
    end
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def update
    @location = Location.find(params[:id])
    @location.update(location_params)
    redirect_to locations_path
  end


  def create
    @location = Location.new(location_params)
    respond_to do |format|
      if @location.save
        format.html { redirect_to locations_path, notice: "Location was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :outline, :description, :address, photos: [])
  end

  def set_location
    @location = Location.find(params[:id])
  end
end

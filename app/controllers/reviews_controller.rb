class ReviewsController < ApplicationController
  before_action :set_venue, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.venue = @venue
    @review.user_id = current_user.id
    @review.save
    if @review.save
      redirect_to venue_path(@venue)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating, :booking_purpose, :venue_id)
  end

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

end

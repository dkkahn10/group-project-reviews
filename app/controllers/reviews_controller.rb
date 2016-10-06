class ReviewsController < ApplicationController
  def index
    @reviews = Review.find(params[:location_id])
  end

  def new
    @review = Review.new
    @location = Location.find(params[:location_id])
  end

  def create

    @review = Review.create(review_params)
    @review.location_id = params[:location_id]
    @location = @review.location
    @review.user = current_user
    
    if @review.save
      redirect_to location_path(@location), notice: "Review added successfully"
    else
      flash[:notice] = @review.errors.full_messages.join(", ")
      render :new
    end
  end

  private
    def review_params
      params.require(:review).permit(:intimacy_rating, :reasoning)
    end
end

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

  def edit
    @review = Review.find(params[:id])
    @location = Location.find(params[:location_id])
  end

  def update
    @review = Review.find(params[:id])
    @location = Location.find(params[:location_id])

    if @review.update_attributes(review_params)
      flash[:notice] = "Review was succesfully edited."
      redirect_to location_path(@location)
    else
      flash[:notice] = @review.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @location = Location.find(params[:location_id])
    if @review.user == current_user || current_user.admin?
      @review.destroy
      flash[:notice] = "Review was deleted"
      redirect_to location_path(@location)
    end
  end

  private
  def review_params
    params.require(:review).permit(:intimacy_rating, :reasoning)
  end
end

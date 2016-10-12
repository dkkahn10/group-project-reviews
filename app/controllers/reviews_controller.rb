class ReviewsController < ApplicationController
  # before_action :vote_status
  # respond_to :html, :json

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
      flash[:notice] = "Review added successfully"
      redirect_to location_path(@location)
    else
      flash[:notice] = @review.errors.full_messages.join(", ")
      render :new
    end
  end

  def upvote
    @review = Review.find(params[:review_id])
    @user = current_user

    respond_to do |format|
      if @vote.save
        format.json { render json: @review }
      end
    end
  end

  def downvote
    @review = Review.find(params[:review_id])
    @user = current_user

    respond_to do |format|
      if @vote.save
        format.json { render json: @review }
      end
    end
  end

  private
  def review_params
    params.require(:review).permit(:intimacy_rating, :reasoning)
  end
end

# protected
#
# def vote_status
#     @review = Review.find(params[:review_id])
#     @vote = Vote.find_or_initialize_by(review: @review, user: current_user)
#   end
# end

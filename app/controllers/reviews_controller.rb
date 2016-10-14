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
      ReviewMailer.new_review(@review).deliver_now
      flash[:notice] = "Review added successfully"
      redirect_to location_path(@location)
    else
      flash[:notice] = @review.errors.full_messages.join(", ")
      render :new
    end
  end

  def upvote
    @review = Review.find(params[:id])
    @user = current_user
    @vote = Vote.find_by(user_id: @user.id, review_id: @review.id)
    if @vote.nil?
      @vote = Vote.create(user_id: @user.id, review_id: @review.id, vote_value: true)
    elsif @vote.vote_value == true
      @vote.destroy
    else
      @vote.update(vote_value: true)
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: { review: @review, vote: @review.tally } }
    end
  end

  def downvote
    @review = Review.find(params[:id])
    @user = current_user
    @vote = Vote.find_by(user_id: @user.id, review_id: @review.id)

    if @vote.nil?
      @vote = Vote.create(user_id: @user.id, review_id: @review.id, vote_value: false)
    elsif @vote.vote_value == false
      @vote.destroy
    else
      @vote.update(vote_value: false)
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: { review: @review, vote: @review.tally } }
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
    params.require(:review).permit(:intimacy_rating, :reasoning, :votes_total)
  end
end

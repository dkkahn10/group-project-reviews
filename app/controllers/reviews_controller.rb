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
      @vote.vote_value = true
    end

    @votes = @review.votes
    @vote_sum = 0
    @votes.each do |vote|
      if vote.vote_value == true
        @vote_sum += 1
      else vote.vote_value == false
        @vote_sum -= 1
      end
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: @review, data: @vote_sum}
      format.js
    end
  end

  def downvote
    @review = Review.find(params[:id])
    @user = current_user
    @vote = Vote.find_by(user_id: @user.id, review_id: @review.id)

    if @vote.nil?
      @vote = Vote.create(user_id: @user.id, review_id: @review.id, vote_value: true)
    elsif @vote.vote_value == false
      @vote.destroy
    else
      @vote.vote_value = false
    end

    @votes = @review.votes
    @review.votes_total = 0
    @votes.each do |vote|
      if vote.vote_value == true
        @review.votes_total += 1
      else vote.vote_value == false
        @review.votes_total -= 1
      end
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: @review, data: @vote_sum}
      format.js
    end
  end

  private

  def review_params
    params.require(:review).permit(:intimacy_rating, :reasoning)
  end

end

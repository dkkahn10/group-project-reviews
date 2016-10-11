class VotesController < ApplicationController
  before_action :vote_status
  respond_to :html, :json

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

  protected

  def vote_status
    @review = Review.find(params[:review_id])
    @vote = Vote.find_or_initialize_by(review: @review, user: current_user)
  end
end

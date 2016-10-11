class VotesController < ApplicationController
  def update
    @location = Location.find(params[:id])
    @reviews = @location.reviews

    @votes = Votes.find(params[:id])

  end
end

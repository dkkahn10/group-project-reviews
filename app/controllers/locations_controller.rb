class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
    @reviews = @location.reviews 
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to location_path(@location), notice: "New Location successfully added"
    else
      flash[:notice] = @location.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(:name_of_location, :description)
  end
end

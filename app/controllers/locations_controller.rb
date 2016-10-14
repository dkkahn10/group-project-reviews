class LocationsController < ApplicationController
  def index
    @locations = if params[:search]
                   Location.search(params[:search])
                 else
                   Location.all
                 end
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
    @location.user = current_user
    if @location.save
      flash[:notice] = "New Location successfully added"
      redirect_to location_path(@location)
    else
      flash[:notice] = @location.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    if @location.update_attributes(location_params)
      flash[:notice] = "Location was succesfully edited."
      redirect_to location_path(@location)
    else
      flash[:notice] = @location.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id])
    if @location.user == current_user || current_user.admin?
      @location.destroy
      flash[:notice] = "Location was deleted"
      redirect_to locations_path
    end
  end

  private

  def location_params
    params.require(:location).permit(:name_of_location, :description)
  end
end

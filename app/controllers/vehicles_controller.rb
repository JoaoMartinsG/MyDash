class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])

    @info = {
        "Maintenances" => @vehicle.maintenances.sum(:price),
        "Problems" => @vehicle.problems.sum(:price),
        "Wishlist" => @vehicle.wishlists.sum(:price)
      }
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    @vehicle.update(vehicle_params)
    redirect_to vehicle_path(@vehicle)
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    redirect_to vehicle_path, status: :see_other
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:type_of_vehicle, :make, :model, :plate, :year, :mileage, :driver)
  end
end

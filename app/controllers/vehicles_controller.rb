class VehiclesController < ApplicationController
  def index
    @vehicle = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
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

  private

  def vehicle_params
    params.require(:vehicle).permit(:type_of_vehicle, :make, :model, :plate, :year, :mileage, :driver)
  end
end

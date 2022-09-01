class MaintenancesController < ApplicationController
  def index
    @vehicle = Vehicle.find(params[:vehicle_id])
    @maintenances = @vehicle.maintenances
  end

  def show
    @vehicle = Vehicle.find(params[:vehicle_id])
    @maintenance = Maintenance.find(params[:id])
  end

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @maintenance = Maintenance.new
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @maintenance = Maintenance.new(maintenance_params)
    @maintenance.vehicle = @vehicle
    if @maintenance.save
      redirect_to vehicle_maintenances_path(@vehicle)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:vehicle_id])
    @maintenance = Maintenance.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:vehicle_id])
    @maintenance = Maintenance.find(params[:id])
    @maintenance.update(maintenance_params)
    redirect_to vehicle_maintenance_path(@maintenance)
  end

  def destroy
    @vehicle = Vehicle.find(params[:vehicle_id])
    @maintenance = Maintenance.find(params[:id])
    @maintenance.vehicle.destroy
    redirect_to vehicle_maintenances_path(@vehicle), status: :see_other
  end

  private

  def maintenance_params
    params.require(:maintenance).permit(:title, :description, :priority, :recorrency, :price, :status)
  end
end

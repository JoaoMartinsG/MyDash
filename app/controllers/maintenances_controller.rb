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
      redirect_to vehicle_path(@vehicle, active: 'maintenance')
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
    redirect_to vehicle_path(@vehicle, active: 'maintenance')
  end

  def destroy
    @vehicle = Vehicle.find(params[:vehicle_id])
    @maintenance = Maintenance.find(params[:id])
    @maintenance.destroy
    redirect_to vehicle_path(@vehicle, active: 'maintenance'), status: :see_other
  end

  def done
    @vehicle = Vehicle.find(params[:vehicle_id])
    @maintenance = Maintenance.find(params[:id])
    if @maintenance.repeat?
      new_maintenance = @maintenance.dup
      new_maintenance.done_date = DateTime.now
      new_maintenance.save!
    end
    @maintenance.status = true
    @maintenance.done_date = DateTime.now
    @maintenance.save!

    redirect_to vehicle_path(@vehicle, active: 'maintenance'), status: :see_other
  end

  private

  def maintenance_params
    params.require(:maintenance).permit(:title, :description, :priority, :repeat, :price, :status)
  end
end

class ProblemsController < ApplicationController
  def index
    @vehicle = Vehicle.find(params[:vehicle_id])
    @problems = @vehicle.problems
  end

  def show
    @vehicle = Vehicle.find(params[:vehicle_id])
    @problem = Problem.find(params[:id])
  end

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @problem = Problem.new
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @problem = Problem.new(problem_params)
    @problem.vehicle = @vehicle
    if @problem.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:vehicle_id])
    @problem = Problem.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:vehicle_id])
    @problem = Problem.find(params[:id])
    @problem.update(problem_params)
    redirect_to vehicle_path(@vehicle)
  end

  def destroy
    @vehicle = Vehicle.find(params[:vehicle_id])
    @problem = Problem.find(params[:id])
    @problem.destroy
    redirect_to vehicle_path(@vehicle), status: :see_other
  end

  def done
    @vehicle = Vehicle.find(params[:vehicle_id])
    @problem = Problem.find(params[:id])
    @problem.status = true
    @problem.done_date = Date.new
    @problem.save!

    redirect_to vehicle_path(@vehicle), status: :see_other
  end

  private

  def problem_params
    params.require(:problem).permit(:title, :description, :priority, :price, :status)
  end
end

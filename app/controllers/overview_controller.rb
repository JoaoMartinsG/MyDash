class OverviewController < ApplicationController
  def index
    @vehicles = Vehicle.all
    @maintenances = Maintenance.all
    @problems = Problem.all
    @wishlists = Wishlist.all

    @total_maintenances = 0
    @total_problems = 0
    @total_wishlists = 0

    current_user.vehicles.each do |vehicle|
      @total_maintenances += vehicle.maintenances.where(status: true).sum(:price)
      @total_problems += vehicle.problems.where(status: true).sum(:price)
      @total_wishlists += vehicle.wishlists.where(status: true).sum(:price)
    end

    @info =
      {
        "Maintenances" => @total_maintenances,
        "Problems" => @total_problems,
        "Wishlist" => @total_wishlists
      }
  end
end

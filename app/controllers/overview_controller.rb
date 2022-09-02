class OverviewController < ApplicationController
  def index
    @vehicles = Vehicle.all
    @maintenances = Maintenance.all
    @problems = Problem.all
    @wishlists = Wishlist.all
  end
end

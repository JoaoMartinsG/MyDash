class WishlistsController < ApplicationController
  def index
    @vehicle = Vehicle.find(params[:vehicle_id])
    @wishlists = @vehicle.wishlists
  end

  def show
    @vehicle = Vehicle.find(params[:vehicle_id])
    @wishlist = Wishlist.find(params[:id])
  end

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @wishlist = Wishlist.new
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @wishlist = Wishlist.new(wishlist_params)
    @wishlist.vehicle = @vehicle
    if @wishlist.save
      redirect_to vehicle_wishlists_path(@vehicle)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:vehicle_id])
    @wishlist = Wishlist.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:vehicle_id])
    @wishlist = Wishlist.find(params[:id])
    @wishlist.update(wishlist_params)
    redirect_to vehicle_wishlist_path(@wishlist)
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:name, :url, :price, :status)
  end
end

class AddPriceToWishlist < ActiveRecord::Migration[7.0]
  def change
    add_column :wishlists, :price, :float
  end
end

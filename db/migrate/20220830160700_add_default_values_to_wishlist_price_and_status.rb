class AddDefaultValuesToWishlistPriceAndStatus < ActiveRecord::Migration[7.0]
  def change
    change_column_default :wishlists, :status, 0
    change_column_default :wishlists, :price, 0
  end
end

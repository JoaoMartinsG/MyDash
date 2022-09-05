class ChangingStatusToBool < ActiveRecord::Migration[7.0]
  def change
    remove_column :maintenances, :status
    add_column :maintenances, :status, :boolean, default: false

    remove_column :problems, :status
    add_column :problems, :status, :boolean, default: false

    remove_column :wishlists, :status
    add_column :wishlists, :status, :boolean, default: false
  end
end

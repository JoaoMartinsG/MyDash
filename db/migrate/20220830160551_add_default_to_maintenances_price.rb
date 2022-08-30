class AddDefaultToMaintenancesPrice < ActiveRecord::Migration[7.0]
  def change
    change_column_default :maintenances, :price, 0
  end
end

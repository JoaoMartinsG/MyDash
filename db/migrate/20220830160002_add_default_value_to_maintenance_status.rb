class AddDefaultValueToMaintenanceStatus < ActiveRecord::Migration[7.0]
  def change
    change_column_default :maintenances, :status, 0
  end
end

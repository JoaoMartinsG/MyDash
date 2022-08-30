class ChangingTableTypesAndDefaultValues < ActiveRecord::Migration[7.0]
  def change
    change_column :wishlists, :status, :string
    change_column_default :wishlists, :status, 'Not Bought Yet'

    change_column :problems, :status, :string
    change_column_default :problems, :status, 'Unresolved'

    change_column :maintenances, :status, :string
    change_column_default :maintenances, :status, 'Undone'
  end
end

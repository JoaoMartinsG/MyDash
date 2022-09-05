class AddDoneDateTotables < ActiveRecord::Migration[7.0]
  def change
    add_column :maintenances, :done_date, :date

    add_column :problems, :done_date, :date

    add_column :wishlists, :done_date, :date
  end
end

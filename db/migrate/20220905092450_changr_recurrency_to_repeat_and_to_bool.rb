class ChangrRecurrencyToRepeatAndToBool < ActiveRecord::Migration[7.0]
  def change
    remove_column :maintenances, :recorrency
    add_column :maintenances, :repeat, :boolean, default: false
  end
end

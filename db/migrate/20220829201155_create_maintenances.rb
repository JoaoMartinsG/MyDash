class CreateMaintenances < ActiveRecord::Migration[7.0]
  def change
    create_table :maintenances do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :priority
      t.integer :recorrency
      t.float :price
      t.integer :status

      t.timestamps
    end
  end
end

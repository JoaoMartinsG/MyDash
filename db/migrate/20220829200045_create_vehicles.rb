class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :type_of_vehicle
      t.string :make
      t.string :model
      t.string :plate
      t.integer :year
      t.integer :mileage
      t.string :driver
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

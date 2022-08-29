class CreateWishlists < ActiveRecord::Migration[7.0]
  def change
    create_table :wishlists do |t|
      t.string :name
      t.string :url
      t.integer :status
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end

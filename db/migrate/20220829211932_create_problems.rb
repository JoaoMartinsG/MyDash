class CreateProblems < ActiveRecord::Migration[7.0]
  def change
    create_table :problems do |t|
      t.string :title
      t.string :description
      t.string :priority
      t.float :price
      t.integer :status
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end

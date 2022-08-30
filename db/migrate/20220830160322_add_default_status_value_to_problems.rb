class AddDefaultStatusValueToProblems < ActiveRecord::Migration[7.0]
  def change
    change_column_default :problems, :status, 0
    change_column_default :problems, :price, 0
  end
end

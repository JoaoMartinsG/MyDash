class Problem < ApplicationRecord
  belongs_to :vehicle
  validates :title, :priority, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end

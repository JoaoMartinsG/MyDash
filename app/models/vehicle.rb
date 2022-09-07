class Vehicle < ApplicationRecord
  belongs_to :user
  validates :make, :model, :year, :plate, :type_of_vehicle, presence: true
  validates :plate, uniqueness: true, format: { with: /\d{2}-{1}[A-Z]{2}-{1}\d{2}/, message: "Format Should Be 20-MD-22" }
  has_many :maintenances, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :problems, dependent: :destroy
end

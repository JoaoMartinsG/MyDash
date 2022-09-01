class Vehicle < ApplicationRecord
  belongs_to :user

  has_many :maintenances, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :problems, dependent: :destroy
end

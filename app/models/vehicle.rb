class Vehicle < ApplicationRecord
  belongs_to :user

  has_many :maintenances
  has_many :wishlists
  has_many :problems
end

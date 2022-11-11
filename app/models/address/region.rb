class Address::Region < ApplicationRecord
  validates :name, presence: true
  validates :code, uniqueness: true

  has_many :provinces
  has_many :districts
  has_many :city_municipalities
  has_many :barangays
end

class Address::CityMunicipality < ApplicationRecord
  validates :name, presence: true
  validates :code, uniqueness: true

  belongs_to :region
  belongs_to :province
  belongs_to :district
  has_many :barangays
end

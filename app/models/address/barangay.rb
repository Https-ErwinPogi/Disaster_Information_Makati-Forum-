class Address::Barangay < ApplicationRecord
  validates :name, presence: true
  validates :code, uniqueness: true

  belongs_to :region
  belongs_to :province
  belongs_to :district
  belongs_to :city_municipality
end

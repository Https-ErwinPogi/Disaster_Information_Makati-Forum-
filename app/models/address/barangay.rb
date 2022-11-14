class Address::Barangay < ApplicationRecord
  validates :name, presence: true
  validates :code, uniqueness: true

  belongs_to :region
  belongs_to :province, optional: true
  belongs_to :district, optional: true
  belongs_to :city_municipality, optional: true
end

class RemoveUnnecessaryReferences < ActiveRecord::Migration[7.0]
  def change
    remove_reference :address_city_municipalities, :region
    remove_reference :address_barangays, :region
    remove_reference :address_barangays, :district
    remove_reference :address_barangays, :province
  end
end

class AddReferencePostsToCityMunicipality < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :address_city_municipality
  end
end

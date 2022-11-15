class CityMunicipalityDistrictSerializer < ActiveModel::Serializer
  attributes :name, :district, :id

  def district
    object.district.name
  end
end

class CityMunicipalityProvinceSerializer < ActiveModel::Serializer
  attributes :name, :province, :id

  def province
    object.province.name
  end
end

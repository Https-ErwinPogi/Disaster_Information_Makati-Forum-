class Api::CitiesMunicipalitiesController < ApplicationController
  def index
    district = Address::District.find_by_id(params[:district_id])
    province = Address::Province.find_by_id(params[:province_id])
    if district
      city_municipalities = district.city_municipalities
      render json: city_municipalities, each_serializer: CityMunicipalityDistrictSerializer
    else
      city_municipalities = province.city_municipalities
      render json: city_municipalities, each_serializer: CityMunicipalityProvinceSerializer
    end
  end
end

class Api::CitiesMunicipalitiesProvincesController < ApplicationController
  def index
    province = Address::Province.find(params[:province_id])
    city_municipalities = province.city_municipalities
    render json: city_municipalities, each_serializer: CityMunicipalityProvinceSerializer
  end
end

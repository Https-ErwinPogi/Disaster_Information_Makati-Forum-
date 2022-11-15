class Api::CitiesMunicipalitiesDistrictsController < ApplicationController
  def index
    district = Address::District.find(params[:district_id])
    city_municipalities = district.city_municipalities
    render json: city_municipalities, each_serializer: CityMunicipalityDistrictSerializer
  end
end

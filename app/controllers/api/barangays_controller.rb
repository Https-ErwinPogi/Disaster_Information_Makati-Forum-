class Api::BarangaysController < ApplicationController
  def index
    # city_municipality = Address::CityMunicipality.find_by_id(params[:cities_municipality_id])
    # barangays = city_municipality.barangays
    # render json: barangays, each_serializer: BarangaySerializer
    render json: params
  end
end
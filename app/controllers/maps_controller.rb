class MapsController < ApplicationController

  def index 

  end

  def countries
    countries = File.read('app/assets/geojson/countries.geojson').to_json
    render :json => countries
  end

end

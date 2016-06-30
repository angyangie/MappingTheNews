require 'pry'

class CountriesController < ApplicationController

  before_action :set_user


  def index
    @countries = Country.all
  end

  def show
    params_name = params[:slug_name]

    @country = Country.find_by(slug_name: params_name)

    
    respond_to do |format|
      format.html
      format.js {render json: @country.articles}
    end
  end

  private

  def country_params
    params.require(:country).permit(:id, :name)
  end


end

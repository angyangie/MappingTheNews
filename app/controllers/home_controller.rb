class HomeController < ApplicationController

  protect_from_forgery with: :exception
  
  before_action :set_user, only: :map
  
  def index
  end

  def map 

  end

end

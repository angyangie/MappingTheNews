class HomeController < ApplicationController

  protect_from_forgery with: :exception
  skip_before_action :require_login
  
  def index
  end

  def map 

  end

end

class HomeController < ApplicationController

  protect_from_forgery with: :exception
  skip_before_action :require_login, only: [:index]

  def index
  end

  def map 

  end

end

class ArticlesController < ApplicationController

  before_action :set_user

  def new 
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def show

  end

  private 

  def article_params
    params.require[:article].permit(:name, :url, :country_name)
  end

end

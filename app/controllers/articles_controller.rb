class ArticlesController < ApplicationController

  def new 
    @article = Article.new
  end

  def index
    @articles = Article.all
    binding.pry
  end

  def show

  end

  private 

  def article_params
    params.require[:article].permit(:name, :url, :country_name)
  end

end

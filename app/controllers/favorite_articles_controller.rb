class FavoriteArticlesController < ApplicationController
  before_action :set_user

  def new

  end

  def create

    article = Article.find_by(url: params.first[1])
    user_id = session[:user_id]

    user = User.find(user_id)
    @favorite_article = FavoriteArticle.find_or_create_by(user_id: user_id, article_id: article.id)
    
    if @favorite_article.save
      flash[:alert]=("Favorite article saved!")
    end

  end

  def edit

  end

  def update

  end

  private

  def article_params
    params.require(:favorite_article).permit(:user_id, :article_id)
  end


end

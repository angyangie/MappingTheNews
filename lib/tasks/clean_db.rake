require 'pry'
require 'rest-client'

class DbCleaner

  def clean_db

    all_articles = Article.all

    all_articles.each do |article|
      if !article.user
        article.destroy
      end
    end

  end

end

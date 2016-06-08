require 'pry'
require 'rest-client'

class AssociateCountriesArticles

  def associate_countries_articles

    all_articles = Article.all
    all_countries = Country.all

      all_countries.each do |country|
        all_articles.each do |article|
          if article.country_name == country.name
        
            unless article == nil 
              article.country_id = country.id
              article.save!
            end

          end
        end
      end
end

end
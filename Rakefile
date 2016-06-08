# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :seed_articles => :environment do 
  ArticleSeeder.new.get_articles
end

task :country_creator => :environment do 
  CountryCreator.new.create_countries
end

task :associate_countries_articles => :environment do 
  AssociateCountriesArticles.new.associate_countries_articles
end

# task :clean_db do
# end




# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :country_creator => :environment do 
  CountryCreator.new.create_countries
end

task :seed_articles => :environment do 
  ArticleSeeder.new.get_articles
end

task :seed_articles2 => :environment do 
  ArticleSeeder2.new.get_articles
end

task :associate_countries_articles => :environment do 
  AssociateCountriesArticles.new.associate_countries_articles
end

task :clean_db => :environment do
  DbCleaner.new.clean_db
end

task :country_destroyer => :environment do 
  CountryDestroyer.new.destroy_countries
end

# task :clean_db do
# end




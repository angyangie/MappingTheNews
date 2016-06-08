class Article < ActiveRecord::Base
  belongs_to :country
  has_many :users, through: :favorite_articles
  has_many :favorite_articles

end

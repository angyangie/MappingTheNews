class User < ActiveRecord::Base
  has_many :articles, through: :favorite_articles
  has_many :favorite_articles

  has_secure_password
  validates_presence_of :password
  validates_presence_of :password_confirmation
  validates :password, length: { minimum: 8 }, allow_nil: true

  validates :email, uniqueness: true
  validates_format_of :email,:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_presence_of :first_name
  validates_presence_of :last_name

end
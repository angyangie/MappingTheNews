Rails.application.routes.draw do
 
  resources :favorite_articles
  resources :read_later_articles
 
  root 'home#index'

 resources :articles

 post '/articles/article_save', to: 'articles#article_save'


 resources :countries, except: :show

 get '/countries/:name', to: "countries#show", as: "country_articles"

 # get '/countries/json', to: "map#countries"

 get '/signup', to: "users#new", as: "signup"
 post '/signup', to: "users#create", as: "create"
 get '/update/:id', to: "users#edit",as: "edit"
 patch '/update/:id', to: "users#update", as: "user_update"
 get '/users/:id', to: "users#show", as: "user"


 get '/login', to: "sessions#new", as: "login"
 post '/login', to: "sessions#create"
 get '/logout', to: "sessions#destroy"  


end

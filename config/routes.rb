Rails.application.routes.draw do
 resources :articles

  root 'home#index'

 # get '/countries/json', to: "map#countries"

 get '/signup', to: "users#new", as: "signup"
 post '/signup', to: "users#create", as: "create"
 get '/update/:id', to: "users#edit",as: "edit"
 patch '/update/:id', to: "users#update", as: "user_update"

 get '/login', to: "sessions#new", as: "login"
 post '/login', to: "sessions#create"
 get '/logout', to: "sessions#destroy"  

end

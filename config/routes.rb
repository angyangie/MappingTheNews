Rails.application.routes.draw do
 resources :maps
 resources :countries

 get '/countries/json', to: "map#countries"

end

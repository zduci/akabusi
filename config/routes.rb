Health::Application.routes.draw do
  root "home#index"
  get '/users', to: "users#index"
end

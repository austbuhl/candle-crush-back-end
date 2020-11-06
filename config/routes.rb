Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 

  get '/candles', to: 'candles#index'
  get '/users', to: 'users#profile'

  post '/purchases', to: 'purchases#create'
  get '/purchases', to: 'purchases#index'
  get '/login', to: 'auth#create'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

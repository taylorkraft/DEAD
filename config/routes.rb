Rails.application.routes.draw do

  get '/' => 'sessions#welcome', as: 'root'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  
  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :ratings
  resources :beers do
    resources :ratings, only: [:new, :index]
  end
  # resources :breweries
  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :index]
  resources :games, only: [:create]
  get '/retrieve' => 'auth#retrieve'
  post '/login' => 'auth#create'
end

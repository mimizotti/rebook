Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
  get '/newaccount', to: 'users#new'
  get '/myaccount', to: 'users#show'
  get 'auth/:provider/callback',  to: 'sessions#create'
  get '/search', to: 'search#index'
  get '/help', to: 'help#index'
  resources :sessions, only: [:create, :destroy]

  resources :users, only: [:create]
  resources :categories, only: [:index, :show]
  resources :books, only: [:index, :show]

  get "/:slug" => "categories#show"
end

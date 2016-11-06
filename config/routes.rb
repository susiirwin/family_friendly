Rails.application.routes.draw do
  root 'home#index'
  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/dashboard', to: "dashboards#show"
  get '/search', to: "search#index"

  # resources :users, only: [:edit, :update]

  namespace :users do
    resources :families, only: [:new, :create]
  end
  resources :businesses, only: [:show]

end

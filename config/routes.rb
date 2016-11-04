Rails.application.routes.draw do
  root 'home#index'
  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/dashboard', to: "dashboards#show"

  resources :users, only: [:edit, :update]


end

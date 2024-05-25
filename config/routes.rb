Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "tops#index"
  resources :users
  resources :tackles do
    resources :rods, only: %i[new create edit update destroy]
    resources :reels, only: %i[new create edit update destroy]
    resources :accesories, only: %i[new create edit update destroy]
  end

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :fishing_gears, only: %i[index new create]
end

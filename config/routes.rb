Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get "up" => "rails/health#show", as: :rails_health_check

  root "tops#index"
  resources :users
  resources :tackles do
    resources :rods, only: %i[show new create edit update destroy] do
      collection do
        get :search_makers
      end
    end
    resources :reels, only: %i[show new create edit update destroy]
    resources :accesories, only: %i[show new create edit update destroy]
  end
  resources :password_resets, only: %i[new create edit update]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider

  get '/explanation/', to: "tops#explanation"
  get "/privacy_policy", to: "tops#privacy_policy"
  get "/terms_of_service", to: "tops#terms_of_service"

  resources :fishing_gears
end

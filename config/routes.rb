Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
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
  resources :password_resets, only: %i[new create edit update]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  # Google Oauthルーディング
  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider

  # ポリシー
  get "/privacy_policy", to: "tops#privacy_policy"
  # 利用規約
  get "/terms_of_service", to: "tops#terms_of_service"

  resources :fishing_gears, only: %i[index new create]
end

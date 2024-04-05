Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :bookings, only: [:new, :create]

    # Nested routes for castles under users
    resources :users do
      resources :castles
    end

    resources :castles, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end

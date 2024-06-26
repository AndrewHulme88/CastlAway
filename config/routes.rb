Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :castles do
    collection do
      get "search"
    end
  end
  # Nested routes for castles under users
  resources :users do
    resources :castles do
      resources :bookings do
        resources :reviews, only: [:new, :create]
      end
      resources :favourites, only: [:create, :destroy]
      post 'bookings/:id/approve', to: 'bookings#approve', as: 'approve_booking'
      post 'bookings/:id/deny', to: 'bookings#deny', as: 'deny_booking'
      delete 'bookings/:id', to: 'bookings#destroy', as: 'delete_booking'
      get 'owner_bookings', to: 'bookings#owner', as: 'owner_bookings'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'dashboard', to: 'pages#dashboard'
  get 'home', to: 'pages#home'

end

Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :vehicles, only: %i[new  create show destroy index] do
    resources :bookings, only: %i[new create] do
      member do
        patch :accept
        patch :decline
      end
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end

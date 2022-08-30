Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :vehicles do
    resources :maintenances
    resources :problems
    resources :wishlists
  end
end

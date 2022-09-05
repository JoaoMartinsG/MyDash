Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  namespace :user do
    root to: "overview#index"
  end
  resources :overview, only: [:index]
  patch "/vehicles/:vehicle_id/maintenances/:id/done", to: "maintenances#done", as: :done_vehicle_maintenance
  resources :vehicles do
    resources :maintenances
    resources :problems
    resources :wishlists
  end
end

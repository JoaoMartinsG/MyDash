Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :overview, only: [:index]
  patch "/vehicles/:vehicle_id/maintenances/:id/done", to: "maintenances#done", as: :done_vehicle_maintenance
  patch "/vehicles/:vehicle_id/problems/:id/done", to: "problems#done", as: :done_vehicle_problem
  patch "/vehicles/:vehicle_id/wishlists/:id/done", to: "wishlists#done", as: :done_vehicle_wishlist

  resources :vehicles do
    resources :maintenances
    resources :problems
    resources :wishlists
  end
end

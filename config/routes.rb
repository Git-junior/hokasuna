Rails.application.routes.draw do
  devise_for :stores
  root to: "messages#index"
  resources :stores, only: [:edit, :update]
  resources :rooms, only: [:new, :create]
end

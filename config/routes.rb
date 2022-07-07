Rails.application.routes.draw do
  devise_for :stores
  root to: "messages#index"
end

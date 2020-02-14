Rails.application.routes.draw do
  root "users#edit"
  resources :items
  resources :users, only: [:edit, :show ,]
end

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root "items#index"
  resources :items do
    member do
      get "purchase", to: "items#purchase"
      post "pay", to: "items#pay"
      get "done", to: "items#done"
    end
  end
  resources :categories, only: [:index, :show]
  resources :cards, only: [:new, :create, :destroy, :show] do
    collection do
      post "delete", to: "cards#delete"
      post "show"
    end
  end
end

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
    collection do
      get 'purchase_confirmation'
      get 'purchase'
      get 'edit'
    end
  end
  resources :categories, only: [:index, :show]
  resources :brands, only: [:index, :show]
  delete 'items/:id' => 'items#destroy'
end

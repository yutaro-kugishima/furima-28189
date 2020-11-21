Rails.application.routes.draw do
  get 'item_transactions/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items
  resources :users, only: :show
  resources :orders, only: [:index, :new, :create]
end
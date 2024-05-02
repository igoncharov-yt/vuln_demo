Rails.application.routes.draw do
  get 'receipts/show'
  devise_for :users

  resources :profiles, only: [:show, :edit, :update]
  resources :payments, only: [:index, :create]
  resources :receipts, only: [:show]

  root "home#index"
end

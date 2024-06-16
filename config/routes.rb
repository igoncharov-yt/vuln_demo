Rails.application.routes.draw do
  get 'receipts/show'
  devise_for :users

  resources :profiles, only: [:show, :edit, :update]
  resources :payments, only: [:index, :create]
  get '/payments/create_payment', to: 'payments#create', as: 'create_payment'
  resources :receipts, only: [:show]

  root "home#index"
end

Rails.application.routes.draw do
  devise_for :users

  resources :profiles, only: [:show, :edit, :update]
  resources :payments, only: [:index, :create]

  root "home#index"
end

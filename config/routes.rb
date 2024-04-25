Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :profiles, only: [:show, :edit, :update] do
    patch :send_money, on: :member
  end
  # Defines the root path route ("/")
  root "home#index"
end

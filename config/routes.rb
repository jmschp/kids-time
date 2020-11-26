Rails.application.routes.draw do
  devise_for :users
  resources :activities do
    resources :orders, only: :create
  end

  get '/orders/approved', to: 'orders#approved'

  get '/user_profile', to: 'pages#user_profile'
  get '/user_orders', to: 'pages#user_orders'

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

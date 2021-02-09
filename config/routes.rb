Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :activities do
    resources :orders, only: :create
  end

  get '/orders/approved', to: 'orders#approved'

  get '/user_profile', to: 'pages#user_profile'
  get '/user_orders', to: 'orders#user_orders'
  get '/user_sales', to: 'orders#user_sales'

  root to: 'pages#home'
end

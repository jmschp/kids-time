Rails.application.routes.draw do
  devise_for :users
  resources :activities do
    resources :orders, only: :create
  end
  root to: 'pages#home'
  get '/orders/approved', to: 'orders#approved'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

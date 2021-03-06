Rails.application.routes.draw do
  
  resources :comments
  get "products/do" => "products#do"
  get "carts/create_order"
  get "set_seller" => "application#set_seller"
  get "set_customer" => "application#set_customer"


  resources :product_orders
  resources :orders
  resources :collections
  resources :carts
  
  resources :products do
    resources :specs
  end
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "products#index"

end

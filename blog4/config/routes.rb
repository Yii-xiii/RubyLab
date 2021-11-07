Rails.application.routes.draw do
  get 'users/profile'
  get 'users/follow'
  get 'users/unfollow'
  devise_for :users
  #resources :comments
  resources :blogs do
    resources :comments
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'blogs#index'
end

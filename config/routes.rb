Rails.application.routes.draw do
  devise_for :users
  root 'donations#index'
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  resources :donations, only: :order do
    post 'order', on: :member
  end
end

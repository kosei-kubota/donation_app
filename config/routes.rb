Rails.application.routes.draw do
  devise_for :users
  root to: 'donations#index'
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  resources :donations, only: [:order, :new, :create] do
    post 'order', on: :member
  end
end

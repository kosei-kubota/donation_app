Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'donations#index'
  resources :users, only: [:show, :update]
end

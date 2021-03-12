Rails.application.routes.draw do
  get 'donations/index'
  devise_for :users
  root 'donations#index'
end

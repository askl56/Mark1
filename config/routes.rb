Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'
  devise_for :users
  resources :users
end

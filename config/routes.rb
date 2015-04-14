Rails.application.routes.draw do

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks, only: [:index] do
    resources :likes, only: [:create, :destroy]
  end

  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/FAQ'
  resources :users, only: [:show]
  post :incoming, to: 'incoming#create'
  root to: 'welcome#index'
  devise_for :users
  resources :users
end

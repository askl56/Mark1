Rails.application.routes.draw do

  get 'users/show'
  get 'bookmarks/my_bookmarks'
  get 'topics/my_topics'
  
  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks, only: [:index] do
    resources :likes, only: [:create, :destroy]
  end

  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/FAQ'
  get 'welcome/search'
  resources :users, only: [:show]
  post :incoming, to: 'incoming#create'
  root to: 'welcome#index'
  devise_for :users
  resources :users
end

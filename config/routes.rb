Rails.application.routes.draw do
  get 'bookmarks/my_bookmarks'
  get 'topics/my_topics'

  resources :topics do
    resources :bookmarks, except: [:index, :show, :edit, :update]
  end

  resources :bookmarks, only: [:index] do
    resources :likes, only: [:create, :destroy]
  end

  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/FAQ'
  get 'welcome/search'
  post :incoming, to: 'incoming#create'
  root to: 'welcome#index'
  devise_for :users
  resources :users
end

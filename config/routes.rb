Rails.application.routes.draw do

  resources :topics do
  	resources :bookmarks, except: [:index] do
  		resources :likes, only: [:create, :destroy]
  	end
  end
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/FAQ'
  get 'users/show'
  post :incoming, to: 'incoming#create'
  root to: 'welcome#index'
  devise_for :users
  resources :users
end

Rails.application.routes.draw do
  resources :topics
  
  post :incoming, to: 'incoming#create'
  root to: 'welcome#index'
  devise_for :users
  resources :users
end

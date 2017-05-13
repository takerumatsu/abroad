Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'toppages/europe', to: 'toppages#europe'
  get 'toppages/asia', to: 'toppages#asia'
  get 'toppages/america', to: 'toppages#america'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]
  
  resources :likes, only: [:create, :destory]
  
end

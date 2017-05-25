Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'toppages/europe', to: 'toppages#europe'
  get 'toppages/asia', to: 'toppages#asia'
  get 'toppages/america', to: 'toppages#america'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create] do
    member do
      get :microposts
      get :favorites
    end
  end

  
  resources :likes, only: [:show, :create, :destroy]
  
  get 'rankings/like', to: 'rankings#like'
  get 'rankings/favorite', to: 'rankings#favorite'
  
  resources :microposts, only: [:index, :new, :create, :destroy]
  
  resources :favorites, only: [:create, :destroy]
end

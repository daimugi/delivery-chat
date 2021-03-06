Rails.application.routes.draw do
  
  root to: 'toppages#index'
   
   
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
   
  get 'signup', to: 'users#new'
   
  resources :users, only: [:index, :show, :create, :edit, :update] 
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  resources :posts, only: [:new, :create, :edit, :update, :destroy]
  
  # devise_for :users, controllers: {
  #   sessions:      'users/sessions',
  #   registrations: 'users/registrations'
  # }
end

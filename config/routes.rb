Rails.application.routes.draw do
  
 root to: 'toppages#index'
 
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 
 get 'signup', to: 'users#new'
 resources :users, only: [:index, :show, :create]
 
 
 get 'join', to: 'records#new'
 post 'join', to: 'records#create'
 delete 'leave', to: 'records#destroy'
 
 get 'contact', to: 'customers#new'
 
 resources :customers, only: [:index, :show, :create]
 
 # devise_for :customers, controllers: {
 #  sessions: 'customers/sessions',
 #  # password: 'customers/passwords',
 #  registorations: 'customers/registrations'
 # } 
     
end

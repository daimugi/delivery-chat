Rails.application.routes.draw do
  
 root to: 'toppages#index'
 
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 
 get 'signup', to: 'users#new'
 # post 'users/:id/edit', to: 'users#update'
 resources :users, only: [:index, :show, :create, :edit, :update]
 resources :messages, only: [:create]
 resources :rooms, only: [:show, :create]
end

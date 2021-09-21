Rails.application.routes.draw do
  
  root to: 'toppages#index'
   
   
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
   
  get 'signup', to: 'users#new'
   
  resources :users, only: [:index, :show, :create, :edit, :update] 
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    # sessions: 'users/sessions'
  }
  
  devise_scope :user do
    get 'users/thanks' => 'users/registrations#thanks'
  end
  
  def devise_scope(scope)
    constraint = lambda do |request|
      request.env["devise.mapping"] = Devise.mappings[scope]
      true
    end

    constraints(constraint) do
      yield
    end
  end
end

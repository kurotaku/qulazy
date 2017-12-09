Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'dbmap', to: 'static_pages#dbmap'
  get 'task', to: 'static_pages#task'
  get 'capture', to: 'static_pages#capture'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  get 'result', to: 'posts#result'
  
  resources :users do
    member do
      get :posts
    end
  end
  
  resources :posts
  resources :judges, only: [:create, :destroy]
  
end

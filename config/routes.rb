Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'dbmap', to: 'static_pages#dbmap'
  get 'task', to: 'static_pages#task'
  get 'capture', to: 'static_pages#capture'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'

  resources :users do
    member do
      get :posts
    end
  end
  
  resources :posts do
    collection do
      get 'ajax_incremental_search'
      get 'result'
      get 'answer'
      post 'answer_create'
    end
  end

  resources :judges, only: [:create, :destroy]
  
  resources :not_founds, only: [:index]
  
end

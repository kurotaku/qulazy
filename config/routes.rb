Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'dbmap', to: 'static_pages#dbmap'
  get 'task', to: 'static_pages#task'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users
end

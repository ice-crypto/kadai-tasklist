Rails.application.routes.draw do
  root to: 'tasks#index'
  
  post 'sessions/create'
  delete 'sessions/destroy'
  get 'users/index'
  post 'users/create'
  get 'users/new'
  
  resources :tasks
end

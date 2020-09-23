Rails.application.routes.draw do
  root 'sessions#new'
  resources :tasks
  get '/search', to: 'tasks#search'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end

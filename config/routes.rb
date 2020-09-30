Rails.application.routes.draw do
  root 'sessions#new'
  resources :tasks

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  namespace :admin do
    get '/dashboard', to: 'users#index'
    resources :users, except: [:index]
  end

  get '/search', to: 'tasks#search'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end

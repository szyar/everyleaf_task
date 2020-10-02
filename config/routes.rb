Rails.application.routes.draw do
  resources :labels
  root 'sessions#new'
  resources :tasks

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  namespace :admin do
    get '/dashboard', to: 'users#index'
    get '/toggle/:id', to: 'users#toggle'
    post '/createbyadmin', to: 'users#create_by_admin'
    resources :users, except: [:new, :index]
  end

  get '/search', to: 'tasks#search'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end

Rails.application.routes.draw do


  root to: 'articles#index'


  get 'sessions/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'pages#index'

  get 'about', to: 'pages#about'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'users/delete', to: 'users#delete'
  get 'users/show', to: 'users#show'
  get 'users', to: 'users#index'
  get 'users/edit', to: 'users#edit'
  post 'users/edit', to: 'users#update'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'qui-sommes-nous', to: 'pages#about'

  get 'nouvel-article', to: 'articles#new'



  resources :pages
  resources :articles
  resources :users, except: [:new]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

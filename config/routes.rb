Rails.application.routes.draw do

  resources :profiles
  resources :session, only: [:new, :create, :destroy]

  root 'session#new'
  
  get 'pages/index'

  get 'session/new'

  get 'session/create'

  get 'session/destroy'

  get 'home', to: 'pages#index', as: 'home'
  get 'signup', to:'profiles#new', as: 'signup'
  get 'login', to: 'sessions#create', as: 'login'
  get 'logout', to: 'session#destroy', as: 'logout'

  resources :purchase_histories
  resources :feedbacks
  resources :students
  resources :teachers
  resources :carts
  resources :credit_cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

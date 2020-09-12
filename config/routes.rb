Rails.application.routes.draw do
  resources :courses do
    resources :course_sections
  end
  resources :disciplines
  resources :profiles
  resources :purchase_histories
  resources :feedbacks
  resources :students do
    resources :carts
  end
  resources :teachers
  resources :credit_cards
  resources :session, only: [:new, :create, :destroy]

  root 'session#new'
  
  get 'pages/index'

  get 'home', to: 'pages#index', as: 'home'
  get 'signup', to:'profiles#new', as: 'signup'
  get 'login', to: 'session#create', as: 'login'
  get 'logout', to: 'session#destroy', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

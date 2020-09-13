Rails.application.routes.draw do
  resources :teachers
  resources :students do
    resources :carts
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :purchase_histories
  resources :feedbacks
  resources :disciplines
  resources :credit_cards
  resources :courses do
    resources :course_sections
  end
  resources :admins

  root 'sessions#new'
  get 'home', to: 'pages#index', as: 'home'
  get 'signup', to:'students#new', as: 'signup'
  get 'login', to: 'sessions#create', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  #root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

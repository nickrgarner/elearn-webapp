Rails.application.routes.draw do
  resources :teachers
  resources :students do
    resources :credit_cards, only: [:new, :create, :destroy, :edit, :show, :update]
    resources :carts, only: [:show]
    post 'carts/addtocart', to: 'carts#addtocart', as: 'cart_add'
    post 'carts/removefromcart', to: 'carts#removefromcart', as: 'cart_remove'
    post 'carts/checkout', to: 'carts#checkout', as: 'checkout'
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :purchase_histories
  resources :feedbacks
  resources :disciplines
  resources :courses do
    resources :course_sections, only: [:new, :create, :index]
    post 'course_sections/register', to: 'course_sections#register', as: 'register'
  end
  resources :admins
  resources :user_constraints
  resources :application

  root 'sessions#login'
  get 'home', to: 'pages#admin' ,constraints: UserConstraints.new("Admin")
  get 'home', to: 'pages#teachers', constraints: UserConstraints.new("Teacher")
  get 'home', to: 'pages#students',constraints: UserConstraints.new("Student")
  get 'signup', to:'students#new', as: 'signup'
  get 'login', to: 'sessions#login', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  match "*path", to: "application#index", via: :all

  #root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

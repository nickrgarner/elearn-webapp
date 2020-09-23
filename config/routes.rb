Rails.application.routes.draw do
  resources :teachers
  resources :students do
    resources :credit_cards, only: [:new, :create, :destroy, :edit, :index, :update]
    resources :carts, only: [:index]
    post 'carts/addtocart', to: 'carts#add_to_cart', as: 'cart_add'
    post 'carts/removefromcart', to: 'carts#remove_from_cart', as: 'cart_remove'
    post 'carts/clear', to: 'carts#clear', as: 'cart_clear'
    post 'carts/checkout', to: 'carts#checkout', as: 'checkout'
    post 'carts/OTP', to: 'carts#OTP', as: 'OTP'
  end
  resources :carts, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :purchase_histories, only: [:index]
  resources :disciplines
  resources :courses do
    resources :course_sections, only: [:new, :create, :index] do
      resources :feedbacks, except: [:index, :show, :destroy]
    end
    post 'course_sections/register', to: 'course_sections#register', as: 'register'
  end
  resources :feedbacks, only: [:index, :show, :destroy]
  resources :admins, only: [:edit, :show, :update]
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

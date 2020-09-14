Rails.application.routes.draw do
  resources :teachers
  resources :students do
    resources :carts
    resources :credit_cards, only: [:new, :create, :destroy, :edit, :show, :update]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :purchase_histories
  resources :feedbacks
  resources :disciplines
  resources :courses do
    resources :course_sections, only: [:new, :create, :index]
  end
  resources :admins

  root 'sessions#new'

  get 'home', to: 'pages#index', as: 'home'
  get 'AdminHome', to: 'pages#admin', as: 'admin_home'
  get 'TeacherHome', to: 'pages#teachers', as: 'teacher_home'
  get 'StudentHome', to: 'pages#students', as: 'student_home'
  get 'signup', to:'students#new', as: 'signup'
  get 'login', to: 'sessions#create', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  #root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

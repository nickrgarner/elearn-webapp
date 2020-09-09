Rails.application.routes.draw do
  get 'pages/index'

  get 'session/new'

  get 'session/create'

  get 'session/destroy'

  resources :profiles
  resources :purchase_histories
  resources :feedbacks
  resources :students
  resources :teachers
  resources :carts
  resources :credit_cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :purchase_histories
  resources :feedbacks
  resources :students
  resources :teachers
  resources :carts
  resources :credit_cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

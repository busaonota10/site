Rails.application.routes.draw do
  resources :feedbacks, only: [:show]
  root 'home#index'
end

Rails.application.routes.draw do
  resources :feedbacks, only: [:show, :create]
  root 'home#index'
end

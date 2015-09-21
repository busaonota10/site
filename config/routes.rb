Rails.application.routes.draw do
  resources :feedbacks, :buses, :companies
  root 'home#index'
end

Rails.application.routes.draw do
  resources :feedbacks
  resources :buses
  resources :buses
  root 'home#index'

  resources :companies, defaults: {format: :json} do
    resources :buses
  end

  resources :feedbacks, :users
end

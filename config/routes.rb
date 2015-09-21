Rails.application.routes.draw do
  root 'home#index'

  resources :companies, defaults: {format: :json} do
    resources :buses
  end

  resources :feedbacks, :buses
end

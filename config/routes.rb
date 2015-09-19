Rails.application.routes.draw do
  root 'home#index'

  resources :companies, defaults: {format: :json} do
    resources :lines do
      resources :buses
    end
  end

  resources :feedbacks, :users
end

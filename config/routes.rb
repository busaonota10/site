Rails.application.routes.draw do
  resources :companies do
    resources :lines do
      resources :buses
    end
  end

  resources :users
  resources :feedbacks
end

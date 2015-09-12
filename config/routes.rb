Rails.application.routes.draw do
  resources :companies do
    resources :lines do
      resources :buses do
        resources :feedbacks
      end
    end
  end

  resources :users
end

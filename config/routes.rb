Rails.application.routes.draw do
  root 'home#index'

  resources :suppliers, only: [] do
    collection do
      post :search
    end
  end
end

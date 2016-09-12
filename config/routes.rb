Rails.application.routes.draw do
  root 'home#index'

  resources :suppliers, only: [] do
    collection do
      get :search
      post :search
    end
  end
end

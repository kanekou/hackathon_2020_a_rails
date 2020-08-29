Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:show, :update]
    resource :authenticate, only: [] do
      collection do
        post :sign_up
        post :login
      end
    end
  end
end

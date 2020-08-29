Rails.application.routes.draw do
  namespace :api do
    resources :authenticate, only: [] do
      collection do
        post :sign_up
        post :login
      end
    end
    resources :articles, only: [:index]
    resources :users, only: [:show, :update]
    resources :user_recommended_news_histories, only: [:index]
    resources :m_recommended_news_times, only: [:index]
  end
end

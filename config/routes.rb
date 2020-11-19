Rails.application.routes.draw do
  namespace :api, constraints: { format: 'json' } do
    post :auth, to: 'sessions#auth'

    namespace :restaurants do
      get :search
    end

    resources :restaurants, only: [] do
      member do
        post :like
        post :dislike
      end
    end
  end

  root 'pages#index'
  get '*path' => 'pages#index'
end

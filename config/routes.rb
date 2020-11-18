Rails.application.routes.draw do
  namespace :api do
    namespace :restaurants do
      get 'search'
    end
  end

  root 'pages#index'
  get '*path' => 'pages#index'
end

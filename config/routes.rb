Rails.application.routes.draw do
  root 'pages#index'
  get '*path' => 'pages#index'
end

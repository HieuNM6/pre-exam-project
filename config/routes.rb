Rails.application.routes.draw do
  resources :users
  get 'sessions/new'
  get 'signup' => "users#new"
  root "wellcome#index"
  get 'login' => "sessions#new"
  post 'login' => "sessions#create"
  get 'logout' => "sessions#destroy"
end

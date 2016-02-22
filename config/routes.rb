Rails.application.routes.draw do
  resources :users
  get 'signup' => "users#new"
  root "wellcome#index"

end

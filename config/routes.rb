Rails.application.routes.draw do
  get 'users/new'

  root "wellcome#index"

end

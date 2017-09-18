Rails.application.routes.draw do
  post 'auth', to: 'auth#login'
  get 'auth', to: 'auth#create'
  get 'logout', to: 'auth#logout'
  resources :users

  get 'permission_denied', to: 'errors#permission_denied'

  root to: 'ard#display'
end

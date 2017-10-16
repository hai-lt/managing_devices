Rails.application.routes.draw do
  resources :cameras
  post 'auth', to: 'auth#login'
  get 'auth', to: 'auth#create'
  get 'logout', to: 'auth#logout'

  get 'permission_denied', to: 'errors#permission_denied'

  root to: 'cameras#index'
end

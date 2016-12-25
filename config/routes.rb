Rails.application.routes.draw do
  post 'auth', to: 'auth#login'
  get 'auth', to: 'auth#create'
  get 'logout', to: 'auth#logout'
  resources :timesheets
  resources :light_plans
  resources :users

  get 'permission_denied', to: 'errors#permission_denied'

  get 'ard', to: 'ard#index'
  get 'vihicle', to: 'ard#display'
  root to: 'ard#display'
end

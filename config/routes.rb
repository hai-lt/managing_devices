Rails.application.routes.draw do
  post 'auth', to: 'auth#login'
  get 'auth', to: 'auth#create'
  get 'logout', to: 'auth#logout'

  resources :registers
  resources :rooms, only: [:create, :update, :destroy, :edit, :new]
  resources :lessons, only: [:create, :update, :destroy, :edit, :new]
  resources :ranks, only: [:create, :update, :destroy, :edit, :new]
  resources :positions, only: [:create, :update, :destroy, :edit, :new]
  resources :categories
  resources :reports
  resources :devices

  get 'systemconfig', to: 'systemconfig#system'
  get 'permission_denied', to: 'errors#permission_denied'
end

Rails.application.routes.draw do
  post 'auth', to: 'auth#login'
  get 'auth', to: 'auth#create'

  resources :rooms
  resources :lessons
  resources :positions
  resources :categories
  resources :ranks
  resources :devices

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

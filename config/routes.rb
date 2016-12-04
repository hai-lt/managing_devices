Rails.application.routes.draw do
  post 'auth', to: 'auth#login'
  get 'auth', to: 'auth#create'
  get 'logout', to: 'auth#logout'

  get 'registers', to: 'registers#index'
  post 'registers', to: 'registers#create'
  delete 'registers/:id', to: 'registers#destroy'
  get 'registers/new', to: 'registers#new'

  resources :rooms, only: [:create, :update, :destroy, :edit, :new]
  resources :lessons, only: [:create, :update, :destroy, :edit, :new]
  resources :ranks, only: [:create, :update, :destroy, :edit, :new]
  resources :positions, only: [:create, :update, :destroy, :edit, :new]
  resources :categories
  resources :reports
  resources :devices

  get 'systemconfig', to: 'systemconfig#system'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

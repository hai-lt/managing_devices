Rails.application.routes.draw do
  resources :rooms
  resources :lessons
  resources :positions
  resources :categories
  resources :ranks
  resources :devices

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

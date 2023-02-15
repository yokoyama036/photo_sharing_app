Rails.application.routes.draw do
  resources :pictures
  resources :users
  resources :sessions
  resources :favorites, only: [:index, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

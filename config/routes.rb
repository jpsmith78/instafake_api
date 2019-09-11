Rails.application.routes.draw do
  resources :photos
  resources :likes
  resources :users
  resources :comments
  resources :sessions, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"

end

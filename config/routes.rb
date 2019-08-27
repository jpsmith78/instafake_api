Rails.application.routes.draw do
  resources :photos
  resources :users
  root to: "static#home"

end

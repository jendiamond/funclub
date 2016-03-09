Rails.application.routes.draw do
  resources :users
  resources :workouts
  root 'workouts#index'
end

Rails.application.routes.draw do 
  devise_for :users
  resources :workouts
  root 'workouts#index'
end

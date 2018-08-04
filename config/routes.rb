Rails.application.routes.draw do
  devise_for :users
  resources :users do
  	resources :exercises
  end
  root "dashboard#index"
  resources :dashboard
end


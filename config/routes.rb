Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: "registrations"}
  resources :users do
  	resources :exercises
  end
  root "dashboard#index"
  resource :dashboard, only: [:index] do
  	collection do
  		post :search, to: 'dashboard#search'
  	end
  end
end


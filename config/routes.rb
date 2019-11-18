Rails.application.routes.draw do
  devise_for :users
  root to: "cities#index"
  resources :cities, only: [:index] do
    resources :spots, only: [:index, :new, :create]
  end
  resources :spots, only: [:show, :edit, :update, :destroy] do
    resources :ratings, only: [:create, :update]
  end
  resources :cities, only: [:new, :create, :edit, :update]
  resources :categories, only: [:new, :create]

  get '/spots/:id/toggle_status', to: 'spots#toggle_status', as: "toggle_status"

  get '/dashboard/', to: 'dashboard#show', as: "dashboard"
end

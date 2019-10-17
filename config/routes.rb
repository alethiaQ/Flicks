Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies, only: [:show, :new, :create, :index, :edit, :update]
  root "application#welcome"
  get "/home" => "application#home", as: "homepage"
  get "/auth/facebook/callback" => "sessions#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  post "/logout" => "sessions#destroy"
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :genres, only: [:index, :show]
end
